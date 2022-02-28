# Ballerina by Examples (BBEs) [![BBEs](https://img.shields.io/github/workflow/status/ldclakmal/ballerina-security/BBEs?logo=github&label=Status)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbes.yml)

This section demonstrates the security related Ballerina by examples (BBEs).

> NOTE: These examples are validated against a provided Ballerina version (latest version) with an automated [test-suite](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbes.yml).

| Category | ![BBE][ballerina-bbe-logo] |
|---|---|
| REST API Security | [Service - SSL/TLS][bbe-http-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-http-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-http-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-http-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-http-service-jwt-auth] <br/> [Service - OAuth2][bbe-http-service-oauth2] <br/> [Client - SSL/TLS][bbe-http-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-http-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-http-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-http-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-http-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-http-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-http-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-http-client-oauth2-refresh-token-grant] <br/> [Client - OAuth2 JWT Bearer Grant Type][bbe-http-client-oauth2-jwt-bearer-grant] |
| WebSocket Security | [Service - SSL/TLS][bbe-websocket-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-websocket-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-websocket-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-websocket-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-websocket-service-jwt-auth] <br/> [Service - OAuth2][bbe-websocket-service-oauth2] <br/> [Client - SSL/TLS][bbe-websocket-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-websocket-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-websocket-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-websocket-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-websocket-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-websocket-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-websocket-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-websocket-client-oauth2-refresh-token-grant] <br/> [Client - OAuth2 JWT Bearer Grant Type][bbe-websocket-client-oauth2-jwt-bearer-grant] |
| GraphQL Security | [Service - SSL/TLS][bbe-graphql-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-graphql-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-graphql-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-graphql-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-graphql-service-jwt-auth] <br/> [Service - OAuth2][bbe-graphql-service-oauth2] |
| gRPC Security | [Service - SSL/TLS][bbe-grpc-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-grpc-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-grpc-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-grpc-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-grpc-service-jwt-auth] <br/> [Service - OAuth2][bbe-grpc-service-oauth2] <br/> [Client - SSL/TLS][bbe-grpc-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-grpc-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-grpc-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-grpc-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-grpc-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-grpc-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-grpc-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-grpc-client-oauth2-refresh-token-grant] <br/> [Client - OAuth2 JWT Bearer Grant Type][bbe-grpc-client-oauth2-jwt-bearer-grant] |
| Kafka Security | [SASL Authentication - Consumer][bbe-kafka-consumer-sasl] <br/> [SASL Authentication - Producer][bbe-kafka-producer-sasl] |
| RabbitMQ Security | [Secured Connection - Producer & Consumer][bbe-rabbitmq-security] |
| NATS Security | [Secured Connection - Publisher & Subscriber][bbe-nats-security] |
| STAN Security | [Secured Connection - Publisher & Subscriber][bbe-stan-security] |
| FTP Security | [Listener - SFTP][bbe-ftp-listener-sftp] <br/> [Client - SFTP][bbe-ftp-client-sftp] |
| TCP Security | [TCP Transport Security][bbe-tcp-ssl-tls] |
| Security | [Cryptographic Operations][bbe-cryptography] <br/> [JWT Issue & Validate][bbe-jwt-issue-validate] |
| URL | [URL Encode & Decode][bbe-url-encode-decode] |

[ballerina-bbe-logo]: img/logos/ballerina-bbe-logo.svg

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
[bbe-http-client-oauth2-jwt-bearer-grant]: https://ballerina.io/learn/by-example/http-client-oauth2-jwt-bearer-grant-type.html

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
[bbe-websocket-client-oauth2-jwt-bearer-grant]: https://ballerina.io/learn/by-example/websocket-client-oauth2-jwt-bearer-grant-type.html

[bbe-graphql-service-ssl-tls]: https://ballerina.io/learn/by-example/graphql-service-ssl-tls.html
[bbe-graphql-service-mutual-ssl]: https://ballerina.io/learn/by-example/graphql-service-mutual-ssl.html
[bbe-graphql-service-basic-auth-file]: https://ballerina.io/learn/by-example/graphql-service-basic-auth-file-user-store.html
[bbe-graphql-service-basic-auth-ldap]: https://ballerina.io/learn/by-example/graphql-service-basic-auth-ldap-user-store.html
[bbe-graphql-service-jwt-auth]: https://ballerina.io/learn/by-example/graphql-service-jwt-auth.html
[bbe-graphql-service-oauth2]: https://ballerina.io/learn/by-example/graphql-service-oauth2.html

[bbe-grpc-service-ssl-tls]: https://ballerina.io/learn/by-example/grpc-service-ssl-tls.html
[bbe-grpc-service-mutual-ssl]: https://ballerina.io/learn/by-example/grpc-service-mutual-ssl.html
[bbe-grpc-service-basic-auth-file]: https://ballerina.io/learn/by-example/grpc-service-basic-auth-file-user-store.html
[bbe-grpc-service-basic-auth-ldap]: https://ballerina.io/learn/by-example/grpc-service-basic-auth-ldap-user-store.html
[bbe-grpc-service-jwt-auth]: https://ballerina.io/learn/by-example/grpc-service-jwt-auth.html
[bbe-grpc-service-oauth2]: https://ballerina.io/learn/by-example/grpc-service-oauth2.html
[bbe-grpc-client-ssl-tls]: https://ballerina.io/learn/by-example/grpc-client-ssl-tls.html
[bbe-grpc-client-mutual-ssl]: https://ballerina.io/learn/by-example/grpc-client-mutual-ssl.html
[bbe-grpc-client-basic-auth]: https://ballerina.io/learn/by-example/grpc-client-basic-auth.html
[bbe-grpc-client-bearer-token-auth]: https://ballerina.io/learn/by-example/grpc-client-bearer-token-auth.html
[bbe-grpc-client-self-signed-jwt-auth]: https://ballerina.io/learn/by-example/grpc-client-self-signed-jwt-auth.html
[bbe-grpc-client-oauth2-client-credentials-grant]: https://ballerina.io/learn/by-example/grpc-client-oauth2-client-credentials-grant-type.html
[bbe-grpc-client-oauth2-password-grant]: https://ballerina.io/learn/by-example/grpc-client-oauth2-password-grant-type.html
[bbe-grpc-client-oauth2-refresh-token-grant]: https://ballerina.io/learn/by-example/grpc-client-oauth2-refresh-token-grant-type.html
[bbe-grpc-client-oauth2-jwt-bearer-grant]: https://ballerina.io/learn/by-example/grpc-client-oauth2-jwt-bearer-grant-type.html

[bbe-kafka-consumer-sasl]: https://ballerina.io/learn/by-example/kafka-authentication-sasl-plain-consumer.html
[bbe-kafka-producer-sasl]: https://ballerina.io/learn/by-example/kafka-authentication-sasl-plain-producer.html
[bbe-rabbitmq-security]: https://ballerina.io/learn/by-example/rabbitmq-secure-connection.html
[bbe-nats-security]: https://ballerina.io/learn/by-example/nats-basic-secure-connection.html
[bbe-stan-security]: https://ballerina.io/learn/by-example/nats-streaming-secure-connection.html

[bbe-tcp-ssl-tls]: https://ballerina.io/learn/by-example/tcp-transport-security.html

[bbe-ftp-listener-sftp]: https://ballerina.io/learn/by-example/sftp-listener.html
[bbe-ftp-client-sftp]: https://ballerina.io/learn/by-example/sftp-client.html
