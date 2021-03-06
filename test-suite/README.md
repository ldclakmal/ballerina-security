![Test Suite](https://github.com/ldclakmal/ballerina-security/workflows/Test%20Suite/badge.svg)

# Ballerina Security Test Suite

This is an automated Ballerina security test suite which contains authentication and authorization related scenarios. These tests run on demand with the provided Ballerina version.

### Secured services

#### 1. Basic Auth - LDAP user store

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [osixia/openldap](https://hub.docker.com/r/osixia/openldap) 1.3.0

##### Steps:
1. User configurations are provided to OpenLDAP server with `.ldif`
2. Ballerina service is secured with Basic Auth with LDAP user store. Inbound tokens are validated with the OpenLDAP server.
3. CURL client send requests to Ballerina service.

#### 2. Basic Auth - File user store

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)

##### Steps:
1. User configurations are defined in `users.toml`
2. Ballerina service is secured with Basic Auth with File user store.
3. CURL client send requests to Ballerina service.
    
#### 3. JWT Auth

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [ldclakmal/wso2is-sts](https://hub.docker.com/r/ldclakmal/wso2is-sts) latest
- [jq](https://stedolan.github.io/jq/) 1.6

##### Steps:
1. Service providers are defined in WSO2 IS STS.
2. Ballerina service is secured with JWT Auth. Inbound tokens are validated by Ballerina with the use of configurations
 provided by WSO2 IS STS.
3. CURL client send request to WSO2 IS STS and get the JWT.
4. CURL client send requests to Ballerina service with the received JWT.

#### 4. OAuth2

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [ldclakmal/wso2is-sts](https://hub.docker.com/r/ldclakmal/wso2is-sts) latest
- [jq](https://stedolan.github.io/jq/) 1.6

##### Steps:
1. Service providers are defined in WSO2 IS STS.
2. Ballerina service is secured with OAuth2. Inbound tokens are validated with the WSO2 IS STS introspection endpoint.
3. CURL client send request to WSO2 IS STS and get the OAuth2 token.
4. CURL client send requests to Ballerina service with the received OAuth2 token.
