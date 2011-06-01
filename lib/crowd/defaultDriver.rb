require 'crowd/default.rb'
require 'crowd/defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class SecurityServerPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://localhost:8095/crowd/services/SecurityServer"

  Methods = [
    [ "",
      "findAllGroupRelationships",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllGroupRelationships"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllGroupRelationshipsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "addGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidGroupException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidGroupException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}} }
    ],
    [ "",
      "addPrincipalToRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "findPrincipalByToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidTokenException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "updatePrincipalCredential",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalCredential"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalCredentialResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidCredentialException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidCredentialException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "getGrantedAuthorities",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getGrantedAuthorities"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getGrantedAuthoritiesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "addPrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidPrincipalException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidPrincipalException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidCredentialException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidCredentialException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}} }
    ],
    [ "",
      "addAttributeToPrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addAttributeToPrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addAttributeToPrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "invalidatePrincipalToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "invalidatePrincipalToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "invalidatePrincipalTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "findAllGroupNames",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllGroupNames"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllGroupNamesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "findRoleMemberships",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleMemberships"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleMembershipsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "removePrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "isValidPrincipalToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isValidPrincipalToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isValidPrincipalTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "ApplicationAccessDeniedException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationAccessDeniedException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "authenticatePrincipalSimple",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipalSimple"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipalSimpleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InactiveAccountException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InactiveAccountException", :use=>"literal"}, "ApplicationAccessDeniedException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationAccessDeniedException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidAuthenticationException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthenticationException", :use=>"literal"}} }
    ],
    [ "",
      "removeRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "getCookieInfo",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getCookieInfo"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getCookieInfoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "updatePrincipalAttribute",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalAttribute"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalAttributeResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "searchGroups",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchGroups"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchGroupsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "getCacheTime",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getCacheTime"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getCacheTimeResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "isRoleMember",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isRoleMember"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isRoleMemberResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "updateGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updateGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updateGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "findAllRoleNames",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllRoleNames"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllRoleNamesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "findRoleByName",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleByName"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleByNameResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "isCacheEnabled",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isCacheEnabled"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isCacheEnabledResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "findGroupByName",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupByName"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupByNameResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "removePrincipalFromRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "authenticatePrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InactiveAccountException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InactiveAccountException", :use=>"literal"}, "ApplicationAccessDeniedException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationAccessDeniedException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidAuthenticationException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthenticationException", :use=>"literal"}} }
    ],
    [ "",
      "findGroupMemberships",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupMemberships"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupMembershipsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "addPrincipalToGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "removeGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "removeAttributeFromPrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeAttributeFromPrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeAttributeFromPrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "findAllPrincipalNames",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllPrincipalNames"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllPrincipalNamesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "addRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidRoleException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidRoleException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}} }
    ],
    [ "",
      "createPrincipalToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "createPrincipalToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "createPrincipalTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InactiveAccountException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InactiveAccountException", :use=>"literal"}, "ApplicationAccessDeniedException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationAccessDeniedException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidAuthenticationException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthenticationException", :use=>"literal"}} }
    ],
    [ "",
      "searchRoles",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchRoles"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchRolesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "removePrincipalFromGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "findPrincipalByName",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByName"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByNameResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}} }
    ],
    [ "",
      "resetPrincipalCredential",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "resetPrincipalCredential"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "resetPrincipalCredentialResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidCredentialException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidCredentialException", :use=>"literal"}, "ApplicationPermissionException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ApplicationPermissionException", :use=>"literal"}, "ObjectNotFoundException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"ObjectNotFoundException", :use=>"literal"}, "InvalidEmailAddressException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidEmailAddressException", :use=>"literal"}} }
    ],
    [ "",
      "isGroupMember",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isGroupMember"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isGroupMemberResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "searchPrincipals",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchPrincipals"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchPrincipalsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "getDomain",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getDomain"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getDomainResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}} }
    ],
    [ "",
      "authenticateApplication",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticateApplication"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticateApplicationResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"RemoteException", :use=>"literal"}, "InvalidAuthorizationTokenException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthorizationTokenException", :use=>"literal"}, "InvalidAuthenticationException_"=>{:namespace=>nil, :ns=>"urn:SecurityServer", :encodingstyle=>"document", :name=>"InvalidAuthenticationException", :use=>"literal"}} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

