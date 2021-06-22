[![Ballerina-Security](./images/ballerina-security.png)](https://github.com/ldclakmal/ballerina-security)

**Ballerina Security** repository contains the examples, use-cases, demos, resources related to microservices security patterns with [Ballerina](https://ballerina.io/), which is an open-source programming language for the cloud that makes it easier to use, combine, and create network services.

## Summary

Ballerina [standard library][stdlib] has [Auth][auth], [JWT][jwt], and [OAuth2][oauth2] modules which provide the authentication and authorization framework to secure the APIs of microservices written with [HTTP][http], [WebSocket][websocket], [GraphQL][graphql], [gRPC][grpc], and [WebSub][websub] protocols. The [Crypto][crypto] module facilitates APIs to perform cryptographic operations like hashing, HMAC generation, checksum generation, encryption, decryption, signing data digitally, verifying digitally signed data, etc., with different cryptographic algorithms. The [URL][url] module facilitates APIs to encode and decode a URL or part of a URL.

The [NATS][nats], [STAN][stan], [RabbitMQ][rabbitmq], [Kafka][kafka], [Email][email], [FTP][ftp], [TCP][tcp], and [UDP][udp] modules have their ways of securing APIs which are protocol-dependent.

## Dashboard

This section demonstrates the current status of the security modules of the Ballerina standard library followed by the official references for all the security examples aka Ballerina by examples (BBEs).

| Module | Latest Release | Status | Issues & PRs | Docs & Package |
|---|---|---|---|---|
| [**auth**][auth] | [![tag][auth-badge-tags]][auth-tags] | [![build][auth-badge-build]][auth-build] <br/> [![codecov][auth-badge-codecov]][auth-codecov] | [![issues][auth-badge-issues]][auth-issues] <br/> [![pulls][auth-badge-pulls]][auth-pulls] | [![docs][ballerina-docs-logo]][auth-docs] <br/> [![package][ballerina-central-logo]][auth-package] |
| [**jwt**][jwt] | [![tag][jwt-badge-tags]][jwt-tags] | [![build][jwt-badge-build]][jwt-build] <br/> [![codecov][jwt-badge-codecov]][jwt-codecov] | [![issues][jwt-badge-issues]][jwt-issues] <br/> [![pulls][jwt-badge-pulls]][jwt-pulls] | [![docs][ballerina-docs-logo]][jwt-docs] <br/> [![package][ballerina-central-logo]][jwt-package] |
| [**oauth2**][oauth2] | [![tag][oauth2-badge-tags]][oauth2-tags] | [![build][oauth2-badge-build]][oauth2-build] <br/> [![codecov][oauth2-badge-codecov]][oauth2-codecov] | [![issues][oauth2-badge-issues]][oauth2-issues] <br/> [![pulls][oauth2-badge-pulls]][oauth2-pulls] | [![docs][ballerina-docs-logo]][oauth2-docs] <br/> [![package][ballerina-central-logo]][oauth2-package] |
| [**crypto**][crypto] | [![tag][crypto-badge-tags]][crypto-tags] | [![build][crypto-badge-build]][crypto-build] <br/> [![codecov][crypto-badge-codecov]][crypto-codecov] | [![issues][crypto-badge-issues]][crypto-issues] <br/> [![pulls][crypto-badge-pulls]][crypto-pulls] | [![docs][ballerina-docs-logo]][crypto-docs] <br/> [![package][ballerina-central-logo]][crypto-package] |
| [**url**][url] | [![tag][url-badge-tags]][url-tags] | [![build][url-badge-build]][url-build] <br/> [![codecov][url-badge-codecov]][url-codecov] | [![issues][url-badge-issues]][url-issues] <br/> [![pulls][url-badge-pulls]][url-pulls] | [![docs][ballerina-docs-logo]][url-docs] <br/> [![package][ballerina-central-logo]][url-package] |

## BBEs

This section demonstrates an automated Ballerina security test-suite which integrate the Ballerina by examples (BBEs). These tests run on-demand with the provided Ballerina version in GitHub secrets. Refer to the [BBEs](./bbes) page for more information.

[![BBEs](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbes.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml)

| Category | ![BBE][ballerina-bbe-logo] |
|---|---|
| REST API Security | [Service - SSL/TLS][bbe-http-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-http-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-http-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-http-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-http-service-jwt-auth] <br/> [Service - OAuth2][bbe-http-service-oauth2] <br/> [Client - SSL/TLS][bbe-http-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-http-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-http-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-http-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-http-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-http-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-http-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-http-client-oauth2-refresh-token-grant] |
| GraphQL Security | [Service - SSL/TLS][bbe-graphql-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-graphql-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-graphql-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-graphql-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-graphql-service-jwt-auth] <br/> [Service - OAuth2][bbe-graphql-service-oauth2] |
| WebSocket Security | [Service - SSL/TLS][bbe-websocket-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-websocket-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-websocket-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-websocket-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-websocket-service-jwt-auth] <br/> [Service - OAuth2][bbe-websocket-service-oauth2] <br/> [Client - SSL/TLS][bbe-websocket-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-websocket-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-websocket-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-websocket-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-websocket-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-websocket-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-websocket-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-websocket-client-oauth2-refresh-token-grant] |
| Security | [Cryptographic Operations][bbe-cryptography] <br/> [JWT Issue & Validate][bbe-jwt-issue-validate] |
| URL | [URL Encode & Decode][bbe-url-encode-decode] |

## Examples

This section demonstrates the examples with authentication and authorization for different protocols supported by Ballerina. They are [HTTP][http], [WebSocket][websocket], [GraphQL][graphql], [gRPC][grpc], [WebSub][websub], [NATS][nats], [STAN][stan], [RabbitMQ][rabbitmq], [Kafka][kafka], [Email][email], [FTP][ftp], [TCP][tcp], and [UDP][udp]. Refer to the [examples](./examples) page for more information.

[![Examples](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml)

## Scenarios

This section demonstrates the real-world scenarios which have authentication and authorization requirements and how that can be supported with Ballerina. Refer to the [scenarios](./scenarios) page for more information.

## Integrations

This section demonstrates an automated Ballerina security test-suite which contains authentication and authorization related integration scenarios. These tests run on-demand with the provided Ballerina version in GitHub secrets. Refer to the [integrations](./integrations) page for more information.

[![Integrations](https://github.com/ldclakmal/ballerina-security/actions/workflows/integrations.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml)

## Issues

This section summarizes the issues related to the security aspects of Ballerina standard libraries. These issues are further categorized as bugs, improvements, new features, and tasks. Refer to the [issues](./issues) page for more information.

---
> The following sections have important references which were used for the design and implementation of the current Ballerina Security model and its related components. All the references are open source and publicly available.

## User Guides

- [HTTP Listener Authentication and Authorization - Swan Lake Version](https://ballerina.io/learn/user-guide/security/http-listener-authentication-and-authorization/)
- [HTTP Client Authentication - Swan Lake Version](https://ballerina.io/learn/user-guide/security/http-client-authentication/)
- [Ballerina Authentication and Authorization Design - 1.2.x Version](https://ballerina.io/1.2/learn/writing-secure-ballerina-code/)

## Research & Design

- 2021 Apr - [Review of Ballerina Security APIs of StdLib Protocol Connector Module - Swan Lake Version](https://docs.google.com/document/d/16r_gjBi7SIqVffKVLtKGBevHQRxp7Fnoo9ELyIWV1BM/edit?usp=sharing)
- 2021 Feb - [Re-Design of Ballerina SecureSocket API - Swan Lake Version](https://docs.google.com/document/d/1Y2kLTOw9-sRK1vSEzw5NYdWSA4nwVCvPf3wrbwNDA4s/edit?usp=sharing)
- 2020 Nov - [Design of Ballerina Authentication & Authorization Framework - Swan Lake Version](https://docs.google.com/document/d/1dGw5uUP6kqZNTwMfQ_Ik-k0HTMKhX70XpEA3tys9_kk/edit?usp=sharing)
- 2020 Oct - [Research Comparison on Ballerina Security Features/APIs with Different Programming Languages](https://docs.google.com/spreadsheets/d/1PyMAlAvgkEL0RpW8CVUj1ccW_61Vm6SMbvadFVYRpSA/edit?usp=sharing)
- 2018 Apr - [Ballerina HTTP Service Authentication and Secure HTTP Clients Design - First Draft (0.970.0)](https://docs.google.com/document/d/1GR-z2aNTFybY1LBquxKPvN3J-kWdEL2Y4_X7S570BOU/edit?usp=sharing)

## GitHub Pull Requests

- 2021 Jun - [Implement declarative auth design for upgrade service](https://github.com/ballerina-platform/module-ballerina-websocket/pull/216)
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

## Specifications

- [RFC 8693 - OAuth 2.0 Token Exchange](https://tools.ietf.org/html/rfc8693)
- [RFC 7662 - OAuth 2.0 Token Introspection](https://tools.ietf.org/html/rfc7662)
- [RFC 7519 - JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519)
- [RFC 7518 - JSON Web Algorithms (JWA)](https://tools.ietf.org/html/rfc7518)
- [RFC 7517 - JSON Web Key (JWK)](https://tools.ietf.org/html/rfc7517)
- [RFC 7516 - JSON Web Encryption (JWE)](https://tools.ietf.org/html/rfc7516)
- [RFC 7515 - JSON Web Signature (JWS)](https://tools.ietf.org/html/rfc7515)
- [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)
- [RFC 7617 - The 'Basic' HTTP Authentication Scheme](https://tools.ietf.org/html/rfc7617)

## Guides

- [How to obtain Google OAuth2.0 Credentials](https://ldclakmal.me/ballerina-security/guides/how-to-obtain-google-oauth2-credentials.html)
- [How to obtain Salesforce OAuth2.0 Credentials](https://ldclakmal.me/ballerina-security/guides/how-to-obtain-salesforce-oauth2-credentials.html)
- [How to obtain Twilio Credentials](https://ldclakmal.me/ballerina-security/guides/how-to-obtain-twilio-credentials.html)
- [Private/Public Keys & Digital Certificates](https://ldclakmal.me/ballerina-security/guides/private-public-keys-and-digital-certificates.html)
- [How to Start OpenLDAP Server with User Data](https://ldclakmal.me/ballerina-security/guides/how-to-start-open-ldap-server.html)

---

### About me - <https://ldclakmal.me>

<a href="https://linkedin.com/in/ldclakmal" target="_blank"><img src="./icons/32x/linkedin.png" alt="linkedin"></a>&nbsp;&nbsp;
<a href="https://github.com/ldclakmal" target="_blank"><img src="./icons/32x/github.png" alt="github"></a>&nbsp;&nbsp;
<a href="https://medium.com/@ldclakmal" target="_blank"><img src="./icons/32x/medium.png" alt="medium"></a>&nbsp;&nbsp;
<a href="https://twitter.com/ldclakmal92" target="_blank"><img src="./icons/32x/twitter.png" alt="twitter"></a>&nbsp;&nbsp;
<a href="https://stackoverflow.com/users/4314651/ldclakmal?tab=profile" target="_blank"><img src="./icons/32x/stack-overflow.png" alt="stackoverflow"></a>&nbsp;&nbsp;
<a href="https://scholar.google.com/citations?user=64UY9M0AAAAJ" target="_blank"><img src="./icons/32x/google-scholar.png" alt="google-scholar"></a>&nbsp;&nbsp;
<a href="https://www.flickr.com/people/ldclakmal" target="_blank"><img src="./icons/32x/flickr.png" alt="flickr"></a>

[auth]: https://github.com/ballerina-platform/module-ballerina-auth
[auth-tags]: https://github.com/ballerina-platform/module-ballerina-auth/tags
[auth-build]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/build-timestamped-master.yml
[auth-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-auth
[auth-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fauth
[auth-pulls]: https://github.com/ballerina-platform/module-ballerina-auth/pulls
[auth-docs]: https://docs.central.ballerina.io/ballerina/auth/latest
[auth-package]: https://central.ballerina.io/ballerina/auth
[auth-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-auth?label=
[auth-badge-build]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/build-timestamped-master.yml/badge.svg
[auth-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-auth/branch/master/graph/badge.svg
[auth-badge-issues]: https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/auth.svg?label=Issues
[auth-badge-pulls]: https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-auth?label=PRs

[jwt]: https://github.com/ballerina-platform/module-ballerina-jwt
[jwt-tags]: https://github.com/ballerina-platform/module-ballerina-jwt/tags
[jwt-build]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/build-timestamped-master.yml
[jwt-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-jwt
[jwt-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fjwt
[jwt-pulls]: https://github.com/ballerina-platform/module-ballerina-jwt/pulls
[jwt-docs]: https://docs.central.ballerina.io/ballerina/jwt/latest
[jwt-package]: https://central.ballerina.io/ballerina/jwt
[jwt-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-jwt?label=
[jwt-badge-build]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/build-timestamped-master.yml/badge.svg
[jwt-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-jwt/branch/master/graph/badge.svg
[jwt-badge-issues]: https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/jwt.svg?label=Issues
[jwt-badge-pulls]: https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-jwt?label=PRs

[oauth2]: https://github.com/ballerina-platform/module-ballerina-oauth2
[oauth2-tags]: https://github.com/ballerina-platform/module-ballerina-oauth2/tags
[oauth2-build]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/build-timestamped-master.yml
[oauth2-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2
[oauth2-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Foauth2
[oauth2-pulls]: https://github.com/ballerina-platform/module-ballerina-oauth2/pulls
[oauth2-docs]: https://docs.central.ballerina.io/ballerina/oauth2/latest
[oauth2-package]: https://central.ballerina.io/ballerina/oauth2
[oauth2-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-oauth2?label=
[oauth2-badge-build]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/build-timestamped-master.yml/badge.svg
[oauth2-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2/branch/master/graph/badge.svg
[oauth2-badge-issues]: https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/oauth2.svg?label=Issues
[oauth2-badge-pulls]: https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-oauth2?label=PRs

[crypto]: https://github.com/ballerina-platform/module-ballerina-crypto
[crypto-tags]: https://github.com/ballerina-platform/module-ballerina-crypto/tags
[crypto-build]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/build-timestamped-master.yml
[crypto-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-crypto
[crypto-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fcrypto
[crypto-pulls]: https://github.com/ballerina-platform/module-ballerina-crypto/pulls
[crypto-docs]: https://docs.central.ballerina.io/ballerina/crypto/latest
[crypto-package]: https://central.ballerina.io/ballerina/crypto
[crypto-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-crypto?label=
[crypto-badge-build]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/build-timestamped-master.yml/badge.svg
[crypto-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-crypto/branch/master/graph/badge.svg
[crypto-badge-issues]: https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/crypto.svg?label=Issues
[crypto-badge-pulls]: https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-crypto?label=PRs

[url]: https://github.com/ballerina-platform/module-ballerina-url
[url-tags]: https://github.com/ballerina-platform/module-ballerina-url/tags
[url-build]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/build-timestamped-master.yml
[url-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-url
[url-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Furl
[url-pulls]: https://github.com/ballerina-platform/module-ballerina-url/pulls
[url-docs]: https://docs.central.ballerina.io/ballerina/url/latest
[url-package]: https://central.ballerina.io/ballerina/url
[url-badge-tags]: https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-url?label=
[url-badge-build]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/build-timestamped-master.yml/badge.svg
[url-badge-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-url/branch/master/graph/badge.svg
[url-badge-issues]: https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/url.svg?label=Issues
[url-badge-pulls]: https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-url?label=PRs

[stdlib]: https://github.com/ballerina-platform/ballerina-standard-library
[http]: https://github.com/ballerina-platform/module-ballerina-http
[grpc]: https://github.com/ballerina-platform/module-ballerina-grpc
[websocket]: https://github.com/ballerina-platform/module-ballerina-websocket
[websub]: https://github.com/ballerina-platform/module-ballerina-websub
[graphql]: https://github.com/ballerina-platform/module-ballerina-graphql
[nats]: https://github.com/ballerina-platform/module-ballerinax-nats
[stan]: https://github.com/ballerina-platform/module-ballerinax-stan
[rabbitmq]: https://github.com/ballerina-platform/module-ballerinax-rabbitmq
[kafka]: https://github.com/ballerina-platform/module-ballerinax-kafka
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

[ballerina-central-logo]: ./images/ballerina-central-logo.svg
[ballerina-docs-logo]: ./images/ballerina-docs-logo.svg
[ballerina-bbe-logo]: ./images/ballerina-bbe-logo.svg