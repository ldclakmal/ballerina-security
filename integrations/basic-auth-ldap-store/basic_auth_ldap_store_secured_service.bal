import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener listenerEP = new (9090,
    secureSocket = {
        key: {
            certFile: "./resources/ballerinaPublic.crt",
            keyFile: "./resources/ballerinaPrivate.key"
        }
    }
);

isolated service /orders on listenerEP {

    @http:ResourceConfig {
	    auth: [
	        {
                ldapUserStoreConfig: {
                    domainName: "avix.lk",
                    connectionUrl: "ldap://localhost:389",
                    connectionName: "cn=admin,dc=avix,dc=lk",
                    connectionPassword: "avix123",
                    userSearchBase: "ou=Users,dc=avix,dc=lk",
                    userEntryObjectClass: "inetOrgPerson",
                    userNameAttribute: "uid",
                    userNameSearchFilter: "(&(objectClass=inetOrgPerson)(uid=?))",
                    userNameListFilter: "(objectClass=inetOrgPerson)",
                    groupSearchBase: ["ou=Groups,dc=avix,dc=lk"],
                    groupEntryObjectClass: "groupOfNames",
                    groupNameAttribute: "cn",
                    groupNameSearchFilter: "(&(objectClass=groupOfNames)(cn=?))",
                    groupNameListFilter: "(objectClass=groupOfNames)",
                    membershipAttribute: "member",
                    userRolesCacheEnabled: true,
                    connectionPoolingEnabled: false,
                    connectionTimeout: 5,
                    readTimeout: 60
                },
                scopes: ["developer"]
            }
        ]
	}
    isolated resource function get view() returns json|error {
        return {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
    }

    @http:ResourceConfig {
        auth: [
            {
                ldapUserStoreConfig: {
                    domainName: "avix.lk",
                    connectionUrl: "ldap://localhost:389",
                    connectionName: "cn=admin,dc=avix,dc=lk",
                    connectionPassword: "avix123",
                    userSearchBase: "ou=Users,dc=avix,dc=lk",
                    userEntryObjectClass: "inetOrgPerson",
                    userNameAttribute: "uid",
                    userNameSearchFilter: "(&(objectClass=inetOrgPerson)(uid=?))",
                    userNameListFilter: "(objectClass=inetOrgPerson)",
                    groupSearchBase: ["ou=Groups,dc=avix,dc=lk"],
                    groupEntryObjectClass: "groupOfNames",
                    groupNameAttribute: "cn",
                    groupNameSearchFilter: "(&(objectClass=groupOfNames)(cn=?))",
                    groupNameListFilter: "(objectClass=groupOfNames)",
                    membershipAttribute: "member",
                    userRolesCacheEnabled: true,
                    connectionPoolingEnabled: false,
                    connectionTimeout: 5,
                    readTimeout: 60
                },
                scopes: ["admin"]
            }
        ]
    }
    isolated resource function get add() returns json|error {
        return {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : check random:createIntInRange(1, 100)
                }
            ]
        };
    }
}
