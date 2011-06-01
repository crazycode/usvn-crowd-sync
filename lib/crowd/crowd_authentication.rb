# ===========================================================================
# Copyright (C) 2009, Progress Software Corporation and/or its 
# subsidiaries or affiliates.  All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===========================================================================

module CrowdAuthentication
  #-- extends/patches(?) AuthenticatedSystem

  CROWD_COOKIE_NAME="crowd.token_key"

  protected

  # Accesses the current user from the session.
  def current_user
    @current_user ||= (session[:user] && User.find_by_id(session[:user])) || :false
  end
  
  # Store the given user in the session.
  def current_user=(new_user)
    session[:user] = (new_user.nil? || new_user.is_a?(Symbol)) ? nil : new_user.id
    @current_user = new_user
  end
    
  # When called with before_filter :login_from_cookie will check for an CROWD_COOKIE_NAME
  # cookie and log the user back in if appropriate
  def login_from_crowd_cookie
    
    return unless cookies[CROWD_COOKIE_NAME]  # TODO timer so we only check every minute (needs logged_in?)
    
    token = cookies[CROWD_COOKIE_NAME]
    logger.debug "#{CROWD_COOKIE_NAME}=#{token}"

    begin
      @crowd = Crowd.new
                          
      unless @crowd.valid_user_token?(token, request.user_agent, request.remote_ip)
        logger.debug "Crowd token IS NOT valid"
        self.current_user = :false
        reset_session 
        return            
      end
        
      crowd_user = @crowd.find_by_token(token) # throws if not found
      logger.debug crowd_user

      # TODO User.find_or_create crowd_user.name
      rails_user = User.find_by_login crowd_user.name
      logger.debug rails_user

      if not rails_user:
        rails_user = User.new
        rails_user.login = crowd_user.name
        rails_user.save
      end

      self.current_user = rails_user

     rescue SOAP::FaultError => e
      logger.error e
      self.current_user = :false          
    end
  end
  
end
