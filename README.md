![Ballerina-Security](./img/ballerina-security.png)

**Ballerina Security** contains the examples, use-cases, demos, resources related to microservices security patterns with [Ballerina](https://ballerina.io/), which is an open-source programming language and platform for cloud-era application programmers to easily write software that just works.

Ballerina Security is based on the 5 [standard library][stdlib] modules which are [Auth][auth], [JWT][jwt], [OAuth2][oauth2], [Crypto][crypto], and [URL][url]. These modules provide the authentication and authorization framework for all the microservices which are written with different protocols like [HTTP][http], [gRPC][grpc], [WebSocket][websocket], [WebSub][websub], [GraphQL][graphql], etc.

GitHub Source: <https://github.com/ldclakmal/ballerina-security> <br/><br/>

## Dashboard

| Module | Latest Release | Status | Issues & PRs | Docs & Package |
|---|---|---|---|---|
| [**auth**][auth] | [![tag][auth-badge-tags]][auth-tags] | [![build][auth-badge-build]][auth-build] <br/> [![codecov][auth-badge-codecov]][auth-codecov] | [![issues][auth-badge-issues]][auth-issues] <br/> [![pulls][auth-badge-pulls]][auth-pulls] | [![docs][ballerina-docs-logo]][auth-docs] <br/> [![package][ballerina-central-logo]][auth-package] |
| [**jwt**][jwt] | [![tag][jwt-badge-tags]][jwt-tags] | [![build][jwt-badge-build]][jwt-build] <br/> [![codecov][jwt-badge-codecov]][jwt-codecov] | [![issues][jwt-badge-issues]][jwt-issues] <br/> [![pulls][jwt-badge-pulls]][jwt-pulls] | [![docs][ballerina-docs-logo]][jwt-docs] <br/> [![package][ballerina-central-logo]][jwt-package] |
| [**oauth2**][oauth2] | [![tag][oauth2-badge-tags]][oauth2-tags] | [![build][oauth2-badge-build]][oauth2-build] <br/> [![codecov][oauth2-badge-codecov]][oauth2-codecov] | [![issues][oauth2-badge-issues]][oauth2-issues] <br/> [![pulls][oauth2-badge-pulls]][oauth2-pulls] | [![docs][ballerina-docs-logo]][oauth2-docs] <br/> [![package][ballerina-central-logo]][oauth2-package] |
| [**crypto**][crypto] | [![tag][crypto-badge-tags]][crypto-tags] | [![build][crypto-badge-build]][crypto-build] <br/> [![codecov][crypto-badge-codecov]][crypto-codecov] | [![issues][crypto-badge-issues]][crypto-issues] <br/> [![pulls][crypto-badge-pulls]][crypto-pulls] | [![docs][ballerina-docs-logo]][crypto-docs] <br/> [![package][ballerina-central-logo]][crypto-package] |
| [**url**][url] | [![tag][url-badge-tags]][url-tags] | [![build][url-badge-build]][url-build] <br/> [![codecov][url-badge-codecov]][url-codecov] | [![issues][url-badge-issues]][url-issues] <br/> [![pulls][url-badge-pulls]][url-pulls] | [![docs][ballerina-docs-logo]][url-docs] <br/> [![package][ballerina-central-logo]][url-package] |

| Category | ![BBE][ballerina-bbe-logo] |
|---|---|
| REST API Security | [Service - SSL/TLS][bbe-http-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-http-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-http-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-http-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-http-service-jwt-auth] <br/> [Service - OAuth2][bbe-http-service-oauth2] <br/> [Client - SSL/TLS][bbe-http-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-http-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-http-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-http-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-http-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-http-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-http-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-http-client-oauth2-refresh-token-grant] |
| GraphQL Security | [Service - SSL/TLS][bbe-graphql-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-graphql-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-graphql-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-graphql-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-graphql-service-jwt-auth] <br/> [Service - OAuth2][bbe-graphql-service-oauth2] |
| WebSocket Security | [Service - SSL/TLS][bbe-websocket-service-ssl-tls] <br/> [Service - Mutual SSL][bbe-websocket-service-mutual-ssl] <br/> [Service - Basic Auth File User Store][bbe-websocket-service-basic-auth-file] <br/> [Service - Basic Auth LDAP User Store][bbe-websocket-service-basic-auth-ldap] <br/> [Service - JWT Auth][bbe-websocket-service-jwt-auth] <br/> [Service - OAuth2][bbe-websocket-service-oauth2] <br/> [Client - SSL/TLS][bbe-websocket-client-ssl-tls] <br/> [Client - Mutual SSL][bbe-websocket-client-mutual-ssl] <br/> [Client - Basic Auth][bbe-websocket-client-basic-auth] <br/> [Client - Bearer Token Auth][bbe-websocket-client-bearer-token-auth] <br/> [Client - Self Signed JWT Auth][bbe-websocket-client-self-signed-jwt-auth] <br/> [Client - OAuth2 Client Credentials Grant Type][bbe-websocket-client-oauth2-client-credentials-grant] <br/> [Client - OAuth2 Password Grant Type][bbe-websocket-client-oauth2-password-grant] <br/> [Client - OAuth2 Refresh Token Grant Type][bbe-websocket-client-oauth2-refresh-token-grant] |
| Security | [Cryptographic Operations][bbe-cryptography] <br/> [JWT Issue & Validate][bbe-jwt-issue-validate] |
| URL | [URL Encode & Decode][bbe-url-encode-decode] |

## Test Suite

This section demonstrates an automated Ballerina security test-suite which contains authentication and authorization related integration scenarios and Ballerina by examples (BBEs). These tests run on-demand with the provided Ballerina version in GitHub secrets. Refer to the [test suite](./test-suite).

[![BBE](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml)
[![Integration](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml)

## Examples

This section demonstrates the examples with authentication and authorization for different transport protocols supported by Ballerina. The client and servers are secured with different auth protocols. Refer to the [examples](./examples).

[![Examples](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/examples.yml)

## Scenarios

This section demonstrates the real-world scenarios which have authentication and authorization requirements and how that can be supported with Ballerina. Refer to the [scenarios](./scenarios).

## Guides & Documentations

- [Ballerina Authentication and Authorization Design - Swan Lake Version](https://ballerina.io/swan-lake/learn/security/authentication-and-authorization/)
- [Ballerina Authentication and Authorization Design - 1.2.x Version](https://ballerina.io/1.2/learn/writing-secure-ballerina-code/)

## Research & Design

- 2021 Apr - [Review of Ballerina Security APIs of StdLib Protocol Connector Module - Swan Lake Version](https://docs.google.com/document/d/16r_gjBi7SIqVffKVLtKGBevHQRxp7Fnoo9ELyIWV1BM/edit?usp=sharing)
- 2021 Feb - [Re-Design of Ballerina SecureSocket API - Swan Lake Version](https://docs.google.com/document/d/1Y2kLTOw9-sRK1vSEzw5NYdWSA4nwVCvPf3wrbwNDA4s/edit?usp=sharing)
- 2020 Nov - [Design of Ballerina Authentication & Authorization Framework - Swan Lake Version](https://docs.google.com/document/d/1dGw5uUP6kqZNTwMfQ_Ik-k0HTMKhX70XpEA3tys9_kk/edit?usp=sharing)
- 2020 Oct - [Research Comparison on Ballerina Security Features/APIs with Different Programming Languages](https://docs.google.com/spreadsheets/d/1PyMAlAvgkEL0RpW8CVUj1ccW_61Vm6SMbvadFVYRpSA/edit?usp=sharing)
- 2018 Apr - [Ballerina HTTP Service Authentication and Secure HTTP Clients Design - First Draft (0.970.0)](https://docs.google.com/document/d/1GR-z2aNTFybY1LBquxKPvN3J-kWdEL2Y4_X7S570BOU/edit?usp=sharing)

## Discussions [ballerina-dev@googlegroups.com]

- 2020 Apr - [Support JWT Signature Validation with JWKs](https://groups.google.com/g/ballerina-dev/c/lk3QnvBeT0c/m/b_Apt5wGBgAJ)
- 2019 Aug - [Redundant APIs for Encoding/Decoding](https://groups.google.com/g/ballerina-dev/c/sbASEwIl44k/m/0YlP3IcXFwAJ)
- 2019 Jun - [Refactor Ballerina Outbound Authentication](https://groups.google.com/g/ballerina-dev/c/OvlUscsjT-I/m/VmTTBg-DBAAJ)
- 2019 May - [Update Module Structure for Ballerina Inbound Authentication](https://groups.google.com/g/ballerina-dev/c/7SYDiKeF8p8/m/3GNncS9dAwAJ)
- 2019 May - [Ballerina Inbound Authentication](https://groups.google.com/g/ballerina-dev/c/U3-GY9Q49eQ/m/HAcrWb-qAgAJ)
- 2018 Apr - [Securely invoking an HTTP endpoint with AuthConfig](https://groups.google.com/g/ballerina-dev/c/1q657E_wegQ/m/fjFkg9YnAgAJ)

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

---
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

[ballerina-central-logo]: ./img/ballerina-central-logo.svg
[ballerina-docs-logo]: ./img/ballerina-docs-logo.svg
[ballerina-bbe-logo]: ./img/ballerina-bbe-logo.svg