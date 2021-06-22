[![BBE](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml)

# Ballerina Security - BBEs

This section demonstrates an automated Ballerina security test-suite which integrate the Ballerina by examples (BBEs). These tests run on-demand with the provided Ballerina version in GitHub secrets. Refer to the [workflow](https://github.com/ldclakmal/ballerina-security/actions).

### Directory Structure

```shell
bbes
|__ scripts
|__ resources
```

## BBE Tests

The following BBEs are tested by integrating client and servers of each protocol. The outputs are also verified.

| Category | BBE |
|---|---|
| REST API Security | [Service - SSL/TLS][bbe-http-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-http-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-http-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-http-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-http-service-jwt-auth] <br/> [Service - OAuth2][bbe-http-service-oauth2] <br/> [Client - SSL/TLS][bbe-http-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-http-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-http-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-http-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-http-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-http-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-http-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-http-client-oauth2-refresh-token-grant] |
| GraphQL Security | [Service - SSL/TLS][bbe-graphql-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-graphql-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-graphql-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-graphql-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-graphql-service-jwt-auth] <br/> [Service - OAuth2][bbe-graphql-service-oauth2] |
| WebSocket Security | [Service - SSL/TLS][bbe-websocket-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-websocket-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-websocket-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-websocket-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-websocket-service-jwt-auth] <br/> [Service - OAuth2][bbe-websocket-service-oauth2] <br/> [Client - SSL/TLS][bbe-websocket-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-websocket-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-websocket-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-websocket-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-websocket-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-websocket-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-websocket-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-websocket-client-oauth2-refresh-token-grant] |
| Security | [Cryptographic Operations][bbe-cryptography] <br/> [JWT Issue & Validate][bbe-jwt-issue-validate] |
| URL | [URL Encode & Decode][bbe-url-encode-decode] |

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

[bbe-websocket-service-ssl-tls]: https://ballerina.io/learn/by-example/websocket-service-ssl-tls.html
[bbe-websocket-service-mutual-ssl]: https://ballerina.io/learn/by-example/websocket-service-mutual-ssl.html
[bbe-websocket-service-basic-auth-file]: https://ballerina.io/learn/by-example/websocket-service-basic-auth-file-user-store.html
[bbe-websocket-service-basic-auth-ldap]: https://ballerina.io/learn/by-example/websocket-service-basic-auth-ldap-user-store.html
[bbe-websocket-service-jwt-auth]: https://ballerina.io/learn/by-example/websocket-service-jwt-auth.html
[bbe-websocket-service-oauth2]: https://ballerina.io/learn/by-example/websocket-service-oauth2.html
[bbe-websocket-client-ssl-tls]: https://ballerina.io/learn/by-example/websocket-client-ssl-tls.html
[bbe-websocket-client-mutual-ssl]: https://ballerina.io/learn/by-example/websocket-client-mutual-ssl.html
[bbe-websocket-client-basic-auth]: https://ballerina.io/learn/by-example/websocket-client-basic-auth.html
[bbe-websocket-client-bearer-token-auth]: https://ballerina.io/learn/by-example/websocket-client-bearer-token-auth.html
[bbe-websocket-client-self-signed-jwt-auth]: https://ballerina.io/learn/by-example/websocket-client-self-signed-jwt-auth.html
[bbe-websocket-client-oauth2-client-credentials-grant]: https://ballerina.io/learn/by-example/websocket-client-oauth2-client-credentials-grant-type.html
[bbe-websocket-client-oauth2-password-grant]: https://ballerina.io/learn/by-example/websocket-client-oauth2-password-grant-type.html
[bbe-websocket-client-oauth2-refresh-token-grant]: https://ballerina.io/learn/by-example/websocket-client-oauth2-refresh-token-grant-type.html
