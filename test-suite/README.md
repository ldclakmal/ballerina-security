[![BBE](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml)
[![Integration](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml)

# Ballerina Security Test Suite

This section demonstrates an automated Ballerina security test-suite which contains authentication and authorization related integration scenarios and Ballerina by examples (BBEs). These tests run on-demand with the provided Ballerina version in GitHub secrets. Refer to the [workflow](https://github.com/ldclakmal/ballerina-security/actions).

### Directory Structure

```shell
test-suite
|
|__ bbe
|   |__ access-control
|   |   |__ packages
|   |   |   |__ basic-auth-file-store
|   |   |   |__ basic-auth-ldap-store
|   |   |   |__ jwt-auth
|   |   |   |__ oauth2-bearer-token
|   |   |   |__ oauth2-client-credentials-grant
|   |   |   |__ oauth2-password-grant
|   |   |   |__ oauth2-refresh-token-grant
|   |   |__ scripts
|   |   |__ resources
|   |
|   |__ security
|       |__ packages
|       |   |__ crypto
|       |   |__ url
|       |   |__ jwt
|       |__ scripts
|       |__ resources
|
|__ integration
    |__ packages
    |   |__ basic-auth-file-store
    |   |__ basic-auth-ldap-store
    |   |__ jwt-auth
    |   |__ oauth2
    |__ scripts
    |__ resources

```

### Secured services

#### 1. Basic Auth - File user store

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)

##### Steps:
1. User configurations are defined in `Config.toml`
2. Ballerina service is secured with Basic Auth with file user store. Inbound tokens are validated with the user store configured in `Config.toml`.
3. CURL client sends requests to Ballerina service.

#### 2. Basic Auth - LDAP user store

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [osixia/openldap](https://hub.docker.com/r/osixia/openldap) 1.3.0

##### Steps:
1. User configurations are provided to the OpenLDAP server with `.ldif`
2. Ballerina service is secured with Basic Auth with LDAP user store. Inbound tokens are validated with the user store defined in the OpenLDAP server.
3. CURL client sends requests to Ballerina service.
    
#### 3. JWT Auth

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [ldclakmal/wso2is-sts](https://hub.docker.com/r/ldclakmal/wso2is-sts) latest
- [jq](https://stedolan.github.io/jq/) 1.6

##### Steps:
1. Service providers are defined in WSO2 IS STS.
2. Ballerina service is secured with JWT Auth. Inbound tokens are validated by Ballerina with the use of configurations provided by WSO2 IS STS.
3. CURL client sends a request to WSO2 IS STS and gets the JWT.
4. CURL client sends requests to Ballerina service with the received JWT.

#### 4. OAuth2

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [ldclakmal/wso2is-sts](https://hub.docker.com/r/ldclakmal/wso2is-sts) latest
- [jq](https://stedolan.github.io/jq/) 1.6

##### Steps:
1. Service providers are defined in WSO2 IS STS.
2. Ballerina service is secured with OAuth2. Inbound tokens are validated with the WSO2 IS STS introspection endpoint.
3. CURL client sends a request to WSO2 IS STS and gets the OAuth2 token.
4. CURL client sends requests to Ballerina service with the received OAuth2 token.
