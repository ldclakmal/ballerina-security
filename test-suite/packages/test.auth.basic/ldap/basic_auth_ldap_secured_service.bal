import ballerina/http;
import ballerina/random;
import ballerina/uuid;

listener http:Listener listenerEP = new(9090, {
    secureSocket: {
        key: {
            path: "resources/ballerinaKeystore.p12",
            password: "ballerina"
        }
    }
});

service /orders on listenerEP {

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
                scopes: ["Developer"]
            }
        ]
	}
    resource function get view() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
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
                scopes: ["Admin"]
            }
        ]
    }
    resource function get add() returns json {
        json inventory = {
            "items": [
                {
                    "code": uuid:createType4AsString(),
                    "qty" : checkpanic random:createIntInRange(1, 100)
                }
            ]
        };
        return inventory;
    }
}
