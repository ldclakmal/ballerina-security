import ballerina/http;
import ballerina/ldap;
import ballerina/math;
import ballerina/system;

ldap:LdapConnectionConfig ldapConfig = {
    domainName: "avix.lk",
    connectionURL: "ldap://localhost:389",
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
    connectionTimeoutInMillis: 5000,
    readTimeoutInMillis: 60000,
    retryAttempts: 3
};
ldap:InboundLdapAuthProvider ldapAuthProvider = new(ldapConfig, "openldap-server");
http:BasicAuthHandler ldapAuthHandler = new(ldapAuthProvider);

listener http:Listener listenerEP = new(9090, {
    auth: {
        authHandlers: [ldapAuthHandler]
    },
    secureSocket: {
        keyStore: {
            path: "resources/ballerina-keystore.p12",
            password: "ballerina"
        }
    }
});

@http:ServiceConfig {
	basePath: "/orders"
}
service processOrder on listenerEP {

    @http:ResourceConfig {
	    path: "/view",
	    auth: {
            scopes: ["Developer"]
        }
	}
    resource function viewOrders(http:Caller caller, http:Request req) {
        json inventory = {
            "items": [
                {
                    "code": system:uuid(),
                    "qty" : <int>math:randomInRange(1, 100)
                }
            ]
        };
        checkpanic caller->respond(inventory);
    }

    @http:ResourceConfig {
        path: "/add",
        auth: {
            scopes: ["Admin"]
        }
    }
    resource function addOrder(http:Caller caller, http:Request req) {
        json inventory = {
            "items": [
                {
                    "code": system:uuid(),
                    "qty" : <int>math:randomInRange(1, 100)
                }
            ]
        };
        checkpanic caller->respond(inventory);
    }
}
