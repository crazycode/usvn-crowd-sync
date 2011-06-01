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

#!/usr/bin/env ruby
require 'rubygems'
gem 'soap4r'
require 'yaml'
require 'crowd/defaultDriver.rb'

# Wrapper around Atlassian Crowd's SOAP API
#-- TODO Should this be a module rather than a class?
class Crowd
  
  # testing only
  # attr_reader :server, :server_token
  
  def initialize( config=nil )
    if config 
      @configuration = config
    else
      # TODO die if configuration file is missing
      @configuration = configuration
    end
    
    crowd_server_url = @configuration['crowd_server_url']
    @server = SecurityServerPortType.new(crowd_server_url)

    # run ruby with -d to see SOAP wiredumps.
    @server.wiredump_dev = STDERR if $DEBUG or @debug

#    retries = 0
#    begin
      authenticate_application @configuration['application_name'], @configuration['application_password']
#    rescue SOAP::EmptyResponseError
#      if retries < 5
#        retry
#      else
#        raise
#      end
#    end
  end  
    
  # TODO interpret errors and throw more useful exceptions Invalid Username, Invalid Password, Not Authorized, No such application etc
  # a token is returned which can be set in cookie crowd.token_key
  def authenticate_user(user_name, password, application = nil, user_agent = nil, remote_ip = nil)

    if not application
      application = @server_token.name
    end
     
    validation_factors = create_validation_factors user_agent, remote_ip        
    auth_context = PrincipalAuthenticationContext.new application, PasswordCredential.new(password), user_name, validation_factors
    auth_principal = AuthenticatePrincipal.new @server_token, auth_context
    response = @server.authenticatePrincipal(auth_principal)
    user_token = response.out
  end  
  
  def valid_user_token?(user_token, user_agent = nil, remote_ip = nil)
    validation_factors = create_validation_factors user_agent, remote_ip
      
    response = @server.isValidPrincipalToken(IsValidPrincipalToken.new(@server_token, user_token, validation_factors))
    response.out
  end
    
  # it's not clear what this function does
  def invalidate_user_token(user_name)
    @server.invalidatePrincipalToken(InvalidatePrincipalToken.new(@server_token, user_name))
  end
  
  # this will come from crowd.token_key
  def find_by_token(user_token)
    reponse = @server.findPrincipalByToken(FindPrincipalByToken.new(@server_token, user_token))
    CrowdUser.new reponse.out
  end

  def find_by_name(user_name)
    reponse = @server.findPrincipalByName(FindPrincipalByName.new(@server_token, user_name))
    CrowdUser.new reponse.out
  end

  # add a new user to the directory
  def add_user(user_name, email, first_name, last_name, password, attributes = {})

    principal = SOAPPrincipal.new
    # TODO probably want to set the directory id
    principal.name = user_name
    principal.active = true
    
    principal.attributes = ArrayOfSOAPAttribute.new
    # unfortunately these attributes are directory specific, need a more generic solution
    principal.attributes.push SOAPAttribute.new("mail", ArrayOfString.new(1) { email })
    principal.attributes.push SOAPAttribute.new("givenName", ArrayOfString.new(1) { first_name })
    principal.attributes.push SOAPAttribute.new("sn", ArrayOfString.new(1) { last_name })

    attributes.each do |key,value|
      principal.attributes.push SOAPAttribute.new(key, ArrayOfString.new(1) { value })
    end
    
    parameters = AddPrincipal.new @server_token, principal, PasswordCredential.new(password)
    
    response = @server.addPrincipal parameters
    CrowdUser.new response.out
  end
  
  def delete_user!(user_name)
    @server.removePrincipal(RemovePrincipal.new(@server_token, user_name))
  end
  
  def reset_password!(user_name)
     @server.resetPrincipalCredential(ResetPrincipalCredential.new(@server_token, user_name))
  end
  
  def change_password(user_name, password)
    @server.updatePrincipalCredential(UpdatePrincipalCredential.new(@server_token, user_name, PasswordCredential.new(password)))  
  end
  
  def update_user_attribute(user_name, attribute_name, attribute_value)
    # might need to handle additional types in the future
    soap_attribute = SOAPAttribute.new(attribute_name, ArrayOfString.new(1) { attribute_value })
    @server.updatePrincipalAttribute UpdatePrincipalAttribute.new(@server_token, user_name, soap_attribute)
  end
  
  def add_group(group_name, group_description="")    
    group = SOAPGroup.new
    group.active = true
    group.name = group_name
    group.description = group_description
    response = @server.addGroup(AddGroup.new(@server_token, group))
    response.out
  end 
  
  def delete_group!(group_name)    
    @server.removeGroup(RemoveGroup.new(@server_token, group_name))
  end 
  
  def find_all_group_names()    
    response = @server.findAllGroupNames(FindAllGroupNames.new(@server_token))
    response.out
  end 
  
  def find_users_in_group(group_name)
    response = @server.findGroupByName(FindGroupByName.new(@server_token, group_name))
    if response.out
      return response.out.members
    else
      return nil
    end
  end

  def add_user_to_group(user_name, group_name)
    @server.addPrincipalToGroup(AddPrincipalToGroup.new(@server_token, user_name, group_name))    
  end
  
  def remove_user_from_group(user_name, group_name)
    @server.removePrincipalFromGroup(RemovePrincipalFromGroup.new(@server_token, user_name, group_name))
   end
  
  def group_member?(user_name, group_name)
    response = @server.isGroupMember(IsGroupMember.new(@server_token, group_name, user_name))
    response.out
  end

  def find_group_memberships(user_name)
    response = @server.findGroupMemberships(FindGroupMemberships.new(@server_token, user_name))
    response.out
  end
  
  # criteria is a hash
  # supported keys are principal.name, principal.email, principal.active, principal.directory.id
  # results can be limited by specifying search.max.results and search.index.start
  # note that the actual search behavior is depends on the directory implementation
  def search_users(criteria)
    
    array_of_search_restriction = ArrayOfSearchRestriction.new
  
    criteria.each do |key, value|
      array_of_search_restriction << SearchRestriction.new(key, value)
    end
  
    response = @server.searchPrincipals(SearchPrincipals.new(@server_token, array_of_search_restriction))
    
    crowd_users = Array.new
    response.out.each do |principal|
      crowd_users << CrowdUser.new(principal)
    end
    
    crowd_users
    
  end
  
  private
  
  def authenticate_application(application_name, application_password)
    auth_context = ApplicationAuthenticationContext.new PasswordCredential.new(application_password), application_name
    auth_application = AuthenticateApplication.new auth_context
    reponse = @server.authenticateApplication(auth_application)
    @server_token = reponse.out
  end
  
  def create_validation_factors(user_agent, remote_ip)
    validation_factors = ArrayOfValidationFactor.new
    if user_agent
      validation_factors << (ValidationFactor.new "User-Agent", user_agent)
    end

    if remote_ip
      validation_factors << (ValidationFactor.new "remote_address", remote_ip)
    end
      
    # TODO Might need to handle X-Forwarded-For
    validation_factors
  end
  
  def configuration
    if defined?(CROWD_CONFIG_PATH)
      config_file = CROWD_CONFIG_PATH
    elsif defined?(RAILS_ROOT) and File.exists?(File.join(RAILS_ROOT, 'config/crowd.yml'))
      config_file = File.join(RAILS_ROOT, 'config/crowd.yml')
    else  
      config_file = File.join(File.dirname(__FILE__), 'crowd.yml')
    end
    
    YAML::load(IO.read(config_file))
  end

end

# Wrapper around SOAPPrincipal which provides easy access to attributes
class CrowdUser
  attr_reader :user_id
  attr_reader :active
  attr_reader :attributes
  attr_reader :conception
  attr_reader :description
  attr_reader :directory_id
  attr_reader :last_modified
  attr_reader :name
  
  #-- virtual
  attr_reader :first_name, :last_name, :full_name, :email
  
  def initialize(soap_principal)
    @soap_principal = soap_principal
    
    @user_id = soap_principal.iD
    @active = soap_principal.active
    @conception = soap_principal.conception
    @description = soap_principal.description
    @directory_id = soap_principal.directoryID
    @last_modified = soap_principal.lastModified
    @name = soap_principal.name

    process_attributes_array soap_principal
  end

  # allow attributes to be fetched by name
  #
  # <tt>user.mail</tt> instead of <tt>user.attributes['mail']</tt>
  # 
  # returns <tt>nil</tt> is the attibute does not exist
  def method_missing(attribute_name)
    @attributes["#{attribute_name}"]
  end
  
  def email #:nodoc:
    @attributes["mail"]
  end
  
  def first_name #:nodoc:
    return @attributes["givenName"]
  end

  def last_name #:nodoc: 
    return @attributes["sn"]
  end

  def full_name #:nodoc: 
    "#{first_name} #{last_name}"
  end
  
  private
  # convert the SOAPAttribute[] into a {} for easier access
  def process_attributes_array(soap_principal)
    @attributes = Hash.new
    soap_principal.attributes.each do |attribute|
      # assuming there's only one value
      @attributes[attribute.name] = attribute.values[0]
    end    
  end
  
end
