**Official Website**: <https://ldclakmal.me/ballerina-security>

[![Ballerina-Security][ballerina-security-logo]](https://github.com/ldclakmal/ballerina-security)

The one-stop place to learn/experience the examples, use-cases, demonstrations, and resources related to microservices security patterns with [Ballerina](https://ballerina.io/), which is an open-source programming language for the cloud that makes it easier to use, combine, and create network services.

## Summary

[Ballerina](https://ballerina.io/) is an open-source programming language for the cloud that makes it easier to use, combine, and create network services. Ballerina has first-class support for a whole bunch of security features from transport layer security like SSL/TLS, mTLS to application layer security like Basic Auth, JWT Auth, OAuth2, etc.

Ballerina [standard library][stdlib] has [Auth][auth], [JWT][jwt], and [OAuth2][oauth2] packages which provide the authentication and authorization framework to secure the APIs of microservices written with [HTTP][http], [WebSocket][websocket], [GraphQL][graphql], [gRPC][grpc], and [WebSub][websub] protocols. The [Crypto][crypto] package facilitates APIs to perform cryptographic operations like hashing, HMAC generation, checksum generation, encryption, decryption, signing data digitally, verifying digitally signed data, etc., with different cryptographic algorithms. The [URL][url] module facilitates APIs to encode and decode a URL or part of a URL.
The [Kafka][kafka], [RabbitMQ][rabbitmq], [NATS][nats], [STAN][stan], [Email][email], [FTP][ftp], [TCP][tcp], and [UDP][udp] packages have their ways of securing APIs which are protocol-dependent.

This website is the latest deployed version of this [Ballerina Security GitHub Repository](https://github.com/ldclakmal/ballerina-security), which contains all the examples, use-cases, demonstrations, and resources related to Ballerina Security in one place. So, this is the one-stop place to learn/experience Ballerina Security.

## Dashboard

### Security Packages Status

This section demonstrates the current status of the security-specific packages of the [Ballerina Platform](https://github.com/ballerina-platform). All of these repositories are categorized under the [Ballerina Standard Library](https://github.com/ballerina-platform/ballerina-standard-library) packages.

| Package              | Latest <br/> Release                     | Package Status                                                                                        | Test Status                                                                                              | Bugs                                      | Open <br/> PRs                               | API Docs & Package                                                                                     |
|----------------------|------------------------------------------|-------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|-------------------------------------------|----------------------------------------------|--------------------------------------------------------------------------------------------------------|
| [**auth**][auth]     | [![tag][auth-badge-tags]][auth-tags]     | [![build][auth-badge-build]][auth-build] <br/> [![codecov][auth-badge-codecov]][auth-codecov]         | [![trivy][auth-badge-trivy]][auth-trivy] <br/> [![loadtest][auth-badge-loadtest]][auth-loadtest]         | [![bugs][auth-badge-bugs]][auth-bugs]     | [![pulls][auth-badge-pulls]][auth-pulls]     | [![docs][ballerina-docs-logo]][auth-docs] <br/> [![package][ballerina-central-logo]][auth-package]     |
| [**jwt**][jwt]       | [![tag][jwt-badge-tags]][jwt-tags]       | [![build][jwt-badge-build]][jwt-build] <br/> [![codecov][jwt-badge-codecov]][jwt-codecov]             | [![trivy][jwt-badge-trivy]][jwt-trivy] <br/> [![loadtest][jwt-badge-loadtest]][jwt-loadtest]             | [![bugs][jwt-badge-bugs]][jwt-bugs]       | [![pulls][jwt-badge-pulls]][jwt-pulls]       | [![docs][ballerina-docs-logo]][jwt-docs] <br/> [![package][ballerina-central-logo]][jwt-package]       |
| [**oauth2**][oauth2] | [![tag][oauth2-badge-tags]][oauth2-tags] | [![build][oauth2-badge-build]][oauth2-build] <br/> [![codecov][oauth2-badge-codecov]][oauth2-codecov] | [![trivy][oauth2-badge-trivy]][oauth2-trivy] <br/> [![loadtest][oauth2-badge-loadtest]][oauth2-loadtest] | [![bugs][oauth2-badge-bugs]][oauth2-bugs] | [![pulls][oauth2-badge-pulls]][oauth2-pulls] | [![docs][ballerina-docs-logo]][oauth2-docs] <br/> [![package][ballerina-central-logo]][oauth2-package] |
| [**crypto**][crypto] | [![tag][crypto-badge-tags]][crypto-tags] | [![build][crypto-badge-build]][crypto-build] <br/> [![codecov][crypto-badge-codecov]][crypto-codecov] | [![trivy][crypto-badge-trivy]][crypto-trivy]                                                             | [![bugs][crypto-badge-bugs]][crypto-bugs] | [![pulls][crypto-badge-pulls]][crypto-pulls] | [![docs][ballerina-docs-logo]][crypto-docs] <br/> [![package][ballerina-central-logo]][crypto-package] |
| [**url**][url]       | [![tag][url-badge-tags]][url-tags]       | [![build][url-badge-build]][url-build] <br/> [![codecov][url-badge-codecov]][url-codecov]             | [![trivy][url-badge-trivy]][url-trivy]                                                                   | [![bugs][url-badge-bugs]][url-bugs]       | [![pulls][url-badge-pulls]][url-pulls]       | [![docs][ballerina-docs-logo]][url-docs] <br/> [![package][ballerina-central-logo]][url-package]       |

### Release Compatibility Status

This section demonstrates the current status of the Ballerina programs that are executed against the latest (pre-release/release) Ballerina version which is configurable with individual GitHub actions. Mostly, these actions are used to test the compatibility of existing programs during the RC period of a release.

[![BBEs](https://img.shields.io/github/actions/workflow/status/ldclakmal/ballerina-security/bbes.yml?logo=github&label=BBEs)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbes.yml)
[![Examples](https://img.shields.io/github/actions/workflow/status/ldclakmal/ballerina-security/examples.yml?logo=github&label=Examples)](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml)
[![Scenarios](https://img.shields.io/github/actions/workflow/status/ldclakmal/ballerina-security/scenarios.yml?logo=github&label=Scenarios)](https://github.com/ldclakmal/ballerina-security/actions/workflows/scenarios.yml)

## Ballerina by Examples (BBEs)

This section demonstrates the security related Ballerina by examples (BBEs).

> **Note** These examples are validated against the provided latest Ballerina version with an automated [test-suite](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbes.yml). [![BBEs](https://img.shields.io/github/actions/workflow/status/ldclakmal/ballerina-security/bbes.yml?logo=github&label=Status)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbes.yml)

| Category           | ![BBE][ballerina-bbe-logo]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| REST API Security  | [Service - SSL/TLS][bbe-http-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-http-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-http-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-http-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-http-service-jwt-auth] <br/> [Service - OAuth2][bbe-http-service-oauth2] <br/> [Client - SSL/TLS][bbe-http-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-http-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-http-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-http-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-http-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-http-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-http-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-http-client-oauth2-refresh-token-grant] <br/> [Client - OAuth2 JWT Bearer Grant Type][bbe-http-client-oauth2-jwt-bearer-grant]                                                                            |
| WebSocket Security | [Service - SSL/TLS][bbe-websocket-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-websocket-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-websocket-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-websocket-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-websocket-service-jwt-auth] <br/> [Service - OAuth2][bbe-websocket-service-oauth2] <br/> [Client - SSL/TLS][bbe-websocket-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-websocket-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-websocket-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-websocket-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-websocket-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-websocket-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-websocket-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-websocket-client-oauth2-refresh-token-grant] <br/> [Client - OAuth2 JWT Bearer Grant Type][bbe-websocket-client-oauth2-jwt-bearer-grant] |
| GraphQL Security   | [Service - SSL/TLS][bbe-graphql-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-graphql-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-graphql-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-graphql-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-graphql-service-jwt-auth] <br/> [Service - OAuth2][bbe-graphql-service-oauth2]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| gRPC Security      | [Service - SSL/TLS][bbe-grpc-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-grpc-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-grpc-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-grpc-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-grpc-service-jwt-auth] <br/> [Service - OAuth2][bbe-grpc-service-oauth2] <br/> [Client - SSL/TLS][bbe-grpc-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-grpc-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-grpc-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-grpc-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-grpc-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-grpc-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-grpc-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-grpc-client-oauth2-refresh-token-grant] <br/> [Client - OAuth2 JWT Bearer Grant Type][bbe-grpc-client-oauth2-jwt-bearer-grant]                                                                            |
| Kafka Security     | [SASL Authentication - Consumer][bbe-kafka-consumer-sasl] <br/> [SASL Authentication - Producer][bbe-kafka-producer-sasl]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| RabbitMQ Security  | [Secured Connection - Producer & Consumer][bbe-rabbitmq-security]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| NATS Security      | [Secured Connection - Publisher & Subscriber][bbe-nats-security]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| STAN Security      | [Secured Connection - Publisher & Subscriber][bbe-stan-security]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| FTP Security       | [Listener - SFTP][bbe-ftp-listener-sftp] <br/> [Client - SFTP][bbe-ftp-client-sftp]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| TCP Security       | [TCP Transport Security][bbe-tcp-ssl-tls]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Security           | [Cryptographic Operations][bbe-cryptography] <br/> [JWT Issue & Validate][bbe-jwt-issue-validate]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| URL                | [URL Encode & Decode][bbe-url-encode-decode]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

## Examples

This section demonstrates the security examples with authentication and authorization for different protocols supported by Ballerina.

> **Note** These examples are validated against the provided latest Ballerina version with an automated [test-suite](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml). [![Examples](https://img.shields.io/github/actions/workflow/status/ldclakmal/ballerina-security/examples.yml?logo=github&label=Status)](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml)

1. [HTTP](https://github.com/ldclakmal/ballerina-security/tree/master/examples/http)
2. [WebSocket](https://github.com/ldclakmal/ballerina-security/tree/master/examples/websocket)
3. [GraphQL](https://github.com/ldclakmal/ballerina-security/tree/master/examples/graphql)
4. [gRPC](https://github.com/ldclakmal/ballerina-security/tree/master/examples/grpc)
5. [WebSub](https://github.com/ldclakmal/ballerina-security/tree/master/examples/websub)
6. [Kafka](https://github.com/ldclakmal/ballerina-security/tree/master/examples/kafka)
7. [RabbitMQ](https://github.com/ldclakmal/ballerina-security/tree/master/examples/rabbitmq)
8. [NATS](https://github.com/ldclakmal/ballerina-security/tree/master/examples/nats)
9. [STAN](https://github.com/ldclakmal/ballerina-security/tree/master/examples/stan)
10. [Email](https://github.com/ldclakmal/ballerina-security/tree/master/examples/email)
11. [FTP](https://github.com/ldclakmal/ballerina-security/tree/master/examples/ftp)
12. [TCP](https://github.com/ldclakmal/ballerina-security/tree/master/examples/tcp)
13. UDP _(Pending)_

## Scenarios

This section demonstrates the real-world scenarios which have authentication and authorization requirements and how that can be supported with Ballerina.

> **Note** These scenarios are validated against the provided latest Ballerina version with an automated [test-suite](https://github.com/ldclakmal/ballerina-security/actions/workflows/scenarios.yml). [![Scenarios](https://img.shields.io/github/actions/workflow/status/ldclakmal/ballerina-security/scenarios.yml?logo=github&label=Status)](https://github.com/ldclakmal/ballerina-security/actions/workflows/scenarios.yml)

1. [Ballerina Secure Token Service (STS)](./scenarios/sts)
2. [E-Commerce system](./scenarios/e-commerce-system)
3. [Secured Order Management Service with JWT Auth](https://github.com/ballerina-platform/module-ballerina-jwt/blob/master/examples/order-management-service/README.md)
4. [Secured Order Management Service with OAuth2](https://github.com/ballerina-platform/module-ballerina-oauth2/blob/master/examples/order-management-service/README.md)

---

## References

This section has a collection of important resources which were created/referred for the design and implementation of the current Ballerina Security architecture and its related components. All the resources are open source and publicly available.

### Specifications

- [Specification: Ballerina Auth Library](https://github.com/ballerina-platform/module-ballerina-auth/blob/master/docs/spec/spec.md)
- [Specification: Ballerina JWT Library](https://github.com/ballerina-platform/module-ballerina-jwt/blob/master/docs/spec/spec.md)
- [Specification: Ballerina OAuth2 Library](https://github.com/ballerina-platform/module-ballerina-oauth2/blob/master/docs/spec/spec.md)

### IETF RFCs

- [RFC 8693 - OAuth 2.0 Token Exchange](https://tools.ietf.org/html/rfc8693)
- [RFC 7662 - OAuth 2.0 Token Introspection](https://tools.ietf.org/html/rfc7662)
- [RFC 7519 - JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519)
- [RFC 7518 - JSON Web Algorithms (JWA)](https://tools.ietf.org/html/rfc7518)
- [RFC 7517 - JSON Web Key (JWK)](https://tools.ietf.org/html/rfc7517)
- [RFC 7516 - JSON Web Encryption (JWE)](https://tools.ietf.org/html/rfc7516)
- [RFC 7515 - JSON Web Signature (JWS)](https://tools.ietf.org/html/rfc7515)
- [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)
- [RFC 7617 - The 'Basic' HTTP Authentication Scheme](https://tools.ietf.org/html/rfc7617)

### Blogs

- 2022 Feb - [Securing Microservices with OAuth2](https://medium.com/@ldclakmal/securing-microservices-with-oauth2-475a72bd5ddd)
- 2021 Oct - [Securing Microservices with JWT](https://medium.com/@ldclakmal/securing-microservices-with-jwt-a16b738b110f)
- 2021 Aug - [Microservices Security with Ballerina](https://medium.com/@ldclakmal/microservices-security-with-ballerina-e9d430f05373)
- 2021 Aug - [HTTP Security in Ballerina](https://medium.com/@ldclakmal/http-security-in-ballerina-b0b5927866f9)

### Research & Design

- 2021 Sep - [[Design] Ballerina GraphQL Authentication and Authorization](https://docs.google.com/document/d/1ebwR5qXosyKjT7tSr4HgcYDq1vFsuzQxtiMgdET1G0o/edit?usp=sharing)
- 2021 Apr - [[Review] Ballerina Security APIs of StdLib Protocol Connector Module](https://docs.google.com/document/d/16r_gjBi7SIqVffKVLtKGBevHQRxp7Fnoo9ELyIWV1BM/edit?usp=sharing)
- 2021 Feb - [[Re-Design] Ballerina SecureSocket API](https://docs.google.com/document/d/1Y2kLTOw9-sRK1vSEzw5NYdWSA4nwVCvPf3wrbwNDA4s/edit?usp=sharing)
- 2020 Nov - [[Design] Ballerina Authentication & Authorization Framework](https://docs.google.com/document/d/1dGw5uUP6kqZNTwMfQ_Ik-k0HTMKhX70XpEA3tys9_kk/edit?usp=sharing)
- 2020 Oct - [[Research] Comparison on Ballerina Security Features/APIs with Programming Languages](https://docs.google.com/spreadsheets/d/1PyMAlAvgkEL0RpW8CVUj1ccW_61Vm6SMbvadFVYRpSA/edit?usp=sharing)

### GitHub Pull Requests

- 2021 Aug - [Add JWT bearer grant support for OAuth2](https://github.com/ballerina-platform/module-ballerina-oauth2/pull/287)
- 2021 Aug - [Add HMAC signature support for JWT](https://github.com/ballerina-platform/module-ballerina-jwt/pull/307)
- 2021 Jun - [Implement declarative auth design for WebSocket upgrade service](https://github.com/ballerina-platform/module-ballerina-websocket/pull/216)
- 2021 May - [Implement declarative auth design for GraphQL service](https://github.com/ballerina-platform/module-ballerina-graphql/pull/210)
- 2021 Mar - [Redesign HTTP listener/client SecureSocket API](https://github.com/ballerina-platform/module-ballerina-http/pull/255)
- 2021 Mar - [Add cert file and mTLS support for JDK11 client of OAuth2 module](https://github.com/ballerina-platform/module-ballerina-oauth2/pull/98)
- 2021 Mar - [Add cert file and mTLS support for JDK11 client of JWT module](https://github.com/ballerina-platform/module-ballerina-jwt/pull/137)
- 2021 Feb - [Extend private key/public cert support for JWT signature generation/validation](https://github.com/ballerina-platform/module-ballerina-jwt/pull/109)
- 2021 Feb - [Add support to decode private/public keys from key/cert files](https://github.com/ballerina-platform/module-ballerina-crypto/pull/61)
- 2021 Jan - [Implement Declarative Auth Design](https://github.com/ballerina-platform/module-ballerina-http/pull/155)
- 2021 Jan - [Implement Imperative Auth Design](https://github.com/ballerina-platform/module-ballerina-http/pull/142)
- 2021 Jan - [Read custom fields of OAuth2 introspection response](https://github.com/ballerina-platform/module-ballerina-oauth2/pull/49)
- 2021 Jan - [Send optional parameters to introspection endpoint](https://github.com/ballerina-platform/module-ballerina-http/pull/164)
- 2021 Jan - [Send custom parameters to introspection endpoint](https://github.com/ballerina-platform/module-ballerina-oauth2/pull/53)
- 2020 Apr - [Implement JWT signature validation with JWKs](https://github.com/ballerina-platform/ballerina-lang/pull/22982)
- 2020 Apr - [Add API to generate public key from JWKs parameters](https://github.com/ballerina-platform/ballerina-lang/pull/22890)
- 2019 Aug - [Remove redundant APIs and replace usages of Encoding module](https://github.com/ballerina-platform/ballerina-lang/pull/18309)
- 2019 Jun - [Refactor outbound authentication with custom providers and handlers](https://github.com/ballerina-platform/ballerina-lang/pull/15696)
- 2019 Jun - [Implement OAuth2 Inbound Authentication](https://github.com/ballerina-platform/ballerina-lang/pull/15489)
- 2019 Jun - [Refactor Modules for Inbound Authentication](https://github.com/ballerina-platform/ballerina-lang/pull/15435)
- 2019 May - [Introduce Configuration Pattern for Authn Handlers and Scopes](https://github.com/ballerina-platform/ballerina-lang/pull/15363)
- 2019 May - [Improve HTTP secure client for OAuth2 grant types](https://github.com/ballerina-platform/ballerina-lang/pull/14419)
- 2019 May - [Refactor inbound authentication with custom provider and handlers](https://github.com/ballerina-platform/ballerina-lang/pull/15056)

### YouTube Videos

- 2021 Mar - [How Netflix Scales Its API with GraphQL Federation at *QCon Plus 2021*](https://youtu.be/QrEOvHdH2Cg)
- 2020 Aug - [How to Auth: Secure a GraphQL API with Confidence at *Apollo GraphQL Summit*](https://youtu.be/dBuU61ABEDs)
- 2020 Apr - [What's New With OAuth and OIDC? at *OktaDev*](https://youtu.be/g_aVPdwBTfw)
- 2018 Feb - [OAuth 2.0 and OpenID Connect at *OktaDev*](https://youtu.be/QrEOvHdH2Cg)
- 2017 Nov - [Handling Authentication and Authorization in GraphQL at *GraphQL Summit 2017*](https://youtu.be/4_Bcw7BULC8)

### Books

- [Advanced API Security: OAuth 2.0 and Beyond - 2nd Edition _by Prabath Siriwardena_](https://www.amazon.com/gp/product/1484220498/)
- [Microservices Security in Action _by Prabath Siriwardena and Nuwan Dias_](https://www.amazon.com/gp/product/1617295957/)

### Guides

- [Ballerina HTTP Listener Auth](https://github.com/ldclakmal/ballerina-security/blob/master/guides/ballerina-http-listener-auth.md)
- [Ballerina HTTP Client Auth](https://github.com/ldclakmal/ballerina-security/blob/master/guides/ballerina-http-client-auth.md)
- [How to obtain Google OAuth2.0 Credentials](https://github.com/ldclakmal/ballerina-security/blob/master/guides/how-to-obtain-google-oauth2-credentials.md)
- [How to obtain Twilio Credentials](https://github.com/ldclakmal/ballerina-security/blob/master/guides/how-to-obtain-twilio-credentials.md)
- [How to Start OpenLDAP Server with User Data](https://github.com/ldclakmal/ballerina-security/blob/master/guides/how-to-start-open-ldap-server.md)
- [Cryptography](https://github.com/ldclakmal/ballerina-security/blob/master/guides/cryptography.md)

### Policies

- [Ballerina Security Policy](https://ballerina.io/security-policy/)
- [Scope of the Ballerina Security Domain](https://github.com/ldclakmal/ballerina-security/blob/master/guides/ballerina-security-scope.md)

### [Internal]

- [Security Vulnerability Management Process](https://github.com/wso2-enterprise/internal-support-ballerina/blob/main/docs/security_vulnerability_management_process.md)
- [Open Issues/Tasks](https://github.com/wso2-enterprise/internal-support-ballerina/labels/Type%2FSecurity)

---

### About me - <https://ldclakmal.me>

<a href="https://linkedin.com/in/ldclakmal" target="_blank"><img src="./_resources/icons/32x/linkedin.png" alt="linkedin"></a>&nbsp;&nbsp;
<a href="https://github.com/ldclakmal" target="_blank"><img src="./_resources/icons/32x/github.png" alt="github"></a>&nbsp;&nbsp;
<a href="https://medium.com/@ldclakmal" target="_blank"><img src="./_resources/icons/32x/medium.png" alt="medium"></a>&nbsp;&nbsp;
<a href="https://twitter.com/ldclakmal92" target="_blank"><img src="./_resources/icons/32x/twitter.png" alt="twitter"></a>&nbsp;&nbsp;
<a href="https://stackoverflow.com/users/4314651/ldclakmal?tab=profile" target="_blank"><img src="./_resources/icons/32x/stack-overflow.png" alt="stackoverflow"></a>&nbsp;&nbsp;
<a href="https://scholar.google.com/citations?user=64UY9M0AAAAJ" target="_blank"><img src="./_resources/icons/32x/google-scholar.png" alt="google-scholar"></a>&nbsp;&nbsp;
<a href="https://www.flickr.com/people/ldclakmal" target="_blank"><img src="./_resources/icons/32x/flickr.png" alt="flickr"></a>

[auth]: https://github.com/ballerina-platform/module-ballerina-auth
[auth-tags]: https://github.com/ballerina-platform/module-ballerina-auth/tags
[auth-build]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/build-timestamped-master.yml
[auth-trivy]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/trivy-scan.yml
[auth-loadtest]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/process-load-test-result.yml
[auth-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-auth
[auth-bugs]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fauth+label%3Atype%2Fbug
[auth-pulls]: https://github.com/ballerina-platform/module-ballerina-auth/pulls
[auth-docs]: https://lib.ballerina.io/ballerina/auth/latest
[auth-package]: https://central.ballerina.io/ballerina/auth
[auth-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-auth?label=
[auth-badge-build]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/build-timestamped-master.yml/badge.svg
[auth-badge-trivy]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/trivy-scan.yml/badge.svg
[auth-badge-loadtest]: https://img.shields.io/github/actions/workflow/status/ballerina-platform/module-ballerina-auth/process-load-test-result.yml?label=Load%20Test&logo=github
[auth-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-auth/branch/master/graph/badge.svg
[auth-badge-bugs]: https://img.shields.io/github/issues-search/ballerina-platform/ballerina-standard-library?query=is%3Aopen+label%3Amodule%2Fauth+label%3AType%2FBug&label=&color=30c955
[auth-badge-pulls]: https://img.shields.io/github/issues-pr-raw/ballerina-platform/module-ballerina-auth?label=

[jwt]: https://github.com/ballerina-platform/module-ballerina-jwt
[jwt-tags]: https://github.com/ballerina-platform/module-ballerina-jwt/tags
[jwt-build]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/build-timestamped-master.yml
[jwt-trivy]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/trivy-scan.yml
[jwt-loadtest]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/process-load-test-result.yml
[jwt-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-jwt
[jwt-bugs]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fjwt+label%3Atype%2Fbug
[jwt-pulls]: https://github.com/ballerina-platform/module-ballerina-jwt/pulls
[jwt-docs]: https://lib.ballerina.io/ballerina/jwt/latest
[jwt-package]: https://central.ballerina.io/ballerina/jwt
[jwt-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-jwt?label=
[jwt-badge-build]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/build-timestamped-master.yml/badge.svg
[jwt-badge-trivy]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/trivy-scan.yml/badge.svg
[jwt-badge-loadtest]: https://img.shields.io/github/actions/workflow/status/ballerina-platform/module-ballerina-jwt/process-load-test-result.yml?label=Load%20Test&logo=github
[jwt-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-jwt/branch/master/graph/badge.svg
[jwt-badge-bugs]: https://img.shields.io/github/issues-search/ballerina-platform/ballerina-standard-library?query=is%3Aopen+label%3Amodule%2Fjwt+label%3AType%2FBug&label=&color=30c955
[jwt-badge-pulls]: https://img.shields.io/github/issues-pr-raw/ballerina-platform/module-ballerina-jwt?label=

[oauth2]: https://github.com/ballerina-platform/module-ballerina-oauth2
[oauth2-tags]: https://github.com/ballerina-platform/module-ballerina-oauth2/tags
[oauth2-build]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/build-timestamped-master.yml
[oauth2-trivy]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/trivy-scan.yml
[oauth2-loadtest]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/process-load-test-result.yml
[oauth2-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2
[oauth2-bugs]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Foauth2+label%3Atype%2Fbug
[oauth2-pulls]: https://github.com/ballerina-platform/module-ballerina-oauth2/pulls
[oauth2-docs]: https://lib.ballerina.io/ballerina/oauth2/latest
[oauth2-package]: https://central.ballerina.io/ballerina/oauth2
[oauth2-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-oauth2?label=
[oauth2-badge-build]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/build-timestamped-master.yml/badge.svg
[oauth2-badge-trivy]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/trivy-scan.yml/badge.svg
[oauth2-badge-loadtest]: https://img.shields.io/github/actions/workflow/status/ballerina-platform/module-ballerina-oauth2/process-load-test-result.yml?label=Load%20Test&logo=github
[oauth2-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2/branch/master/graph/badge.svg
[oauth2-badge-bugs]: https://img.shields.io/github/issues-search/ballerina-platform/ballerina-standard-library?query=is%3Aopen+label%3Amodule%2Foauth2+label%3AType%2FBug&label=&color=30c955
[oauth2-badge-pulls]: https://img.shields.io/github/issues-pr-raw/ballerina-platform/module-ballerina-oauth2?label=

[crypto]: https://github.com/ballerina-platform/module-ballerina-crypto
[crypto-tags]: https://github.com/ballerina-platform/module-ballerina-crypto/tags
[crypto-build]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/build-timestamped-master.yml
[crypto-trivy]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/trivy-scan.yml
[crypto-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-crypto
[crypto-bugs]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fcrypto+label%3Atype%2Fbug
[crypto-pulls]: https://github.com/ballerina-platform/module-ballerina-crypto/pulls
[crypto-docs]: https://lib.ballerina.io/ballerina/crypto/latest
[crypto-package]: https://central.ballerina.io/ballerina/crypto
[crypto-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-crypto?label=
[crypto-badge-build]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/build-timestamped-master.yml/badge.svg
[crypto-badge-trivy]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/trivy-scan.yml/badge.svg
[crypto-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-crypto/branch/master/graph/badge.svg
[crypto-badge-bugs]: https://img.shields.io/github/issues-search/ballerina-platform/ballerina-standard-library?query=is%3Aopen+label%3Amodule%2Fcrypto+label%3AType%2FBug&label=&color=30c955
[crypto-badge-pulls]: https://img.shields.io/github/issues-pr-raw/ballerina-platform/module-ballerina-crypto?label=

[url]: https://github.com/ballerina-platform/module-ballerina-url
[url-tags]: https://github.com/ballerina-platform/module-ballerina-url/tags
[url-build]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/build-timestamped-master.yml
[url-trivy]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/trivy-scan.yml
[url-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-url
[url-bugs]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Furl+label%3Atype%2Fbug
[url-pulls]: https://github.com/ballerina-platform/module-ballerina-url/pulls
[url-docs]: https://lib.ballerina.io/ballerina/url/latest
[url-package]: https://central.ballerina.io/ballerina/url
[url-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-url?label=
[url-badge-build]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/build-timestamped-master.yml/badge.svg
[url-badge-trivy]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/trivy-scan.yml/badge.svg
[url-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-url/branch/master/graph/badge.svg
[url-badge-bugs]: https://img.shields.io/github/issues-search/ballerina-platform/ballerina-standard-library?query=is%3Aopen+label%3Amodule%2Furl+label%3AType%2FBug&label=&color=30c955
[url-badge-pulls]: https://img.shields.io/github/issues-pr-raw/ballerina-platform/module-ballerina-url?label=

[stdlib]: https://github.com/ballerina-platform/ballerina-standard-library
[http]: https://github.com/ballerina-platform/module-ballerina-http
[grpc]: https://github.com/ballerina-platform/module-ballerina-grpc
[websocket]: https://github.com/ballerina-platform/module-ballerina-websocket
[websub]: https://github.com/ballerina-platform/module-ballerina-websub
[graphql]: https://github.com/ballerina-platform/module-ballerina-graphql
[kafka]: https://github.com/ballerina-platform/module-ballerinax-kafka
[rabbitmq]: https://github.com/ballerina-platform/module-ballerinax-rabbitmq
[nats]: https://github.com/ballerina-platform/module-ballerinax-nats
[stan]: https://github.com/ballerina-platform/module-ballerinax-stan
[email]: https://github.com/ballerina-platform/module-ballerina-email
[ftp]: https://github.com/ballerina-platform/module-ballerina-ftp
[tcp]: https://github.com/ballerina-platform/module-ballerina-tcp
[udp]: https://github.com/ballerina-platform/module-ballerina-udp

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

[ballerina-central-logo]: ./_resources/images/ballerina-central-logo.svg
[ballerina-docs-logo]: ./_resources/images/ballerina-docs-logo.svg
[ballerina-bbe-logo]: ./_resources/images/ballerina-bbe-logo.svg

[ballerina-security-logo]: ./_resources/images/ballerina-security.png
