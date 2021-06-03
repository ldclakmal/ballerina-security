[![BBE](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml)
[![Integration](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml)

# Ballerina Security Test Suite

This section demonstrates an automated Ballerina security test-suite which contains authentication and authorization related integration scenarios and Ballerina by examples (BBEs). These tests run on-demand with the provided Ballerina version in GitHub secrets. Refer to the [workflow](https://github.com/ldclakmal/ballerina-security/actions).

### Directory Structure

```shell
test-suite
|
|__ bbe
|   |__ scripts
|   |__ resources
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

## BBE Tests

The following BBEs are tested and output is verified.

| Category | BBE |
|---|---|
| REST API Security | [Service - SSL/TLS][bbe-http-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-http-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-http-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-http-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-http-service-jwt-auth] <br/> [Service - OAuth2][bbe-http-service-oauth2] <br/> [Client - SSL/TLS][bbe-http-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-http-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-http-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-http-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-http-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-http-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-http-client-oauth2-password-grant] <br/> [Client - OAuth2 Direct Token Type][bbe-http-client-oauth2-refresh-token-grant] |
| GraphQL Security | [Service - SSL/TLS][bbe-graphql-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-graphql-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-graphql-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-graphql-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-graphql-service-jwt-auth] <br/> [Service - OAuth2][bbe-graphql-service-oauth2] |
| Security | [Cryptographic Operations][bbe-cryptography] <br/> [JWT Issue & Validate][bbe-jwt-issue-validate] |
| URL | [URL Encode & Decode][bbe-url-encode-decode] |

## Integration Tests

### Basic Auth - File user store

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)

##### Steps:
1. User configurations are defined in `Config.toml`
2. Ballerina service is secured with Basic Auth with file user store. Inbound tokens are validated with the user store configured in `Config.toml`.
3. CURL client sends requests to Ballerina service.

### Basic Auth - LDAP user store

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [osixia/openldap](https://hub.docker.com/r/osixia/openldap) 1.3.0

##### Steps:
1. User configurations are provided to the OpenLDAP server with `.ldif`
2. Ballerina service is secured with Basic Auth with LDAP user store. Inbound tokens are validated with the user store defined in the OpenLDAP server.
3. CURL client sends requests to Ballerina service.
    
### JWT Auth

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [ldclakmal/wso2is-sts](https://hub.docker.com/r/ldclakmal/wso2is-sts) latest
- [jq](https://stedolan.github.io/jq/) 1.6

##### Steps:
1. Service providers are defined in WSO2 IS STS.
2. Ballerina service is secured with JWT Auth. Inbound tokens are validated by Ballerina with the use of configurations provided by WSO2 IS STS.
3. CURL client sends a request to WSO2 IS STS and gets the JWT.
4. CURL client sends requests to Ballerina service with the received JWT.

### OAuth2

##### Prerequisites:
- [Ballerina](https://ballerina.io/downloads/)
- [ldclakmal/wso2is-sts](https://hub.docker.com/r/ldclakmal/wso2is-sts) latest
- [jq](https://stedolan.github.io/jq/) 1.6

##### Steps:
1. Service providers are defined in WSO2 IS STS.
2. Ballerina service is secured with OAuth2. Inbound tokens are validated with the WSO2 IS STS introspection endpoint.
3. CURL client sends a request to WSO2 IS STS and gets the OAuth2 token.
4. CURL client sends requests to Ballerina service with the received OAuth2 token.

[bbe-cryptography]: https://ballerina.io/learn/by-example/security-crypto.html
[bbe-jwt-issue-validate]: https://ballerina.io/learn/by-example/security-jwt-issue-validate.html
[bbe-url-encode-decode]: https://ballerina.io/learn/by-example/url-encode-decode.html
[bbe-http-service-ssl-tls]: https://ballerina.io/learn/by-example/http-service-ssl-tls.html
[bbe-http-service-mutual-ssl]: https://ballerina.io/learn/by-example/http-service-mutual-ssl.html
[bbe-http-service-basic-auth-file]: https://ballerina.io/learn/by-example/http-service-basic-auth-file-user-store.html
[bbe-http-service-basic-auth-ldap]: https://ballerina.io/learn/by-example/http-service-basic-auth-ldap-user-store.html
[bbe-http-service-jwt-auth]: https://ballerina.io/learn/by-example/http-service-jwt-auth.html
[bbe-http-service-oauth2]: https://ballerina.io/learn/by-example/http-service-oauth2.html
[bbe-http-client-ssl-tls]: https://ballerina.io/learn/by-example/http-client-ssl-tls.html
[bbe-http-client-mutual-ssl]: https://ballerina.io/learn/by-example/http-client-mutual-ssl.html
[bbe-http-client-basic-auth]: https://ballerina.io/learn/by-example/http-client-basic-auth.html
[bbe-http-client-bearer-token-auth]: https://ballerina.io/learn/by-example/http-client-bearer-token-auth.html
[bbe-http-client-self-signed-jwt-auth]: https://ballerina.io/learn/by-example/http-client-self-signed-jwt-auth.html
[bbe-http-client-oauth2-client-credentials-grant]: https://ballerina.io/learn/by-example/http-client-oauth2-client-credentials-grant-type.html
[bbe-http-client-oauth2-password-grant]: https://ballerina.io/learn/by-example/http-client-oauth2-password-grant-type.html
[bbe-http-client-oauth2-refresh-token-grant]: https://ballerina.io/learn/by-example/http-client-oauth2-refresh-token-grant-type.html
[bbe-graphql-service-ssl-tls]: https://ballerina.io/learn/by-example/graphql-service-ssl-tls.html
[bbe-graphql-service-mutual-ssl]: https://ballerina.io/learn/by-example/graphql-service-mutual-ssl.html
[bbe-graphql-service-basic-auth-file]: https://ballerina.io/learn/by-example/graphql-service-basic-auth-file-user-store.html
[bbe-graphql-service-basic-auth-ldap]: https://ballerina.io/learn/by-example/graphql-service-basic-auth-ldap-user-store.html
[bbe-graphql-service-jwt-auth]: https://ballerina.io/learn/by-example/graphql-service-jwt-auth.html
[bbe-graphql-service-oauth2]: https://ballerina.io/learn/by-example/graphql-service-oauth2.html
