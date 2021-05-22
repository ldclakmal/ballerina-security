<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-69533863-9"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-69533863-9');
</script>
<link rel="shortcut icon" type="image/png" href="img/favicon.png?v=1.0">

![Ballerina-Security](./img/ballerina-security.png)

**Ballerina Security** contains the examples, use-cases, demos, resources related to microservices security patterns with [Ballerina](https://ballerina.io/), which is an open-source programming language and platform for cloud-era application programmers to easily write software that just works.

Ballerina Security is based on the 5 [standard library][stdlib] modules which are [Auth][auth], [JWT][jwt], [OAuth2][oauth2], [Crypto][crypto], and [URL][url]. These modules provide the authentication and authorization framework for all the microservices which are written with different protocols like [HTTP][http], [gRPC][grpc], [WebSocket][websocket], [WebSub][websub], [GraphQL][graphql], etc.

[![stars](https://img.shields.io/github/stars/ldclakmal/ballerina-security?style=social)](https://github.com/ldclakmal/ballerina-security)
[![followers](https://img.shields.io/github/followers/ldclakmal?style=social)](https://github.com/ldclakmal)
[![twitter](https://img.shields.io/twitter/follow/ldclakmal92?label=Follow&style=social)](https://twitter.com/ldclakmal92)

## Dashboard

| Module | Status | Issues & PRs | Docs & Package | BBEs |
|---|---|---|---|---|
| [**auth**][auth] | [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-auth?label=)][auth-tags] <br/> [![build](https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/build-timestamped-master.yml/badge.svg)][auth-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-auth/branch/master/graph/badge.svg)][auth-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/auth.svg?label=Issues)][auth-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-auth?label=PRs)][auth-pulls] | [![Auth API Docs][ballerina-docs-logo]][auth-docs] <br/> [![Auth Package][ballerina-central-logo]][auth-package] | [HTTP Service with Basic Auth File User Store][bbe-service-basic-auth-file] <br/> [HTTP Service with Basic Auth LDAP User Store][bbe-service-basic-auth-ldap] <br/> [HTTP Client with Basic Auth][bbe-client-basic-auth] |
| [**jwt**][jwt] | [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-jwt?label=)][jwt-tags] <br/> [![build](https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/build-timestamped-master.yml/badge.svg)][jwt-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-jwt/branch/master/graph/badge.svg)][jwt-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/jwt.svg?label=Issues)][jwt-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-jwt?label=PRs)][jwt-pulls] | [![JWT API Docs][ballerina-docs-logo]][jwt-docs] <br/> [![JWT Package][ballerina-central-logo]][jwt-package] | [JWT Issue & Validate][bbe-jwt] <br/> [HTTP Service with JWT Auth][bbe-service-jwt-auth] <br/> [HTTP Client with Bearer Token Auth][bbe-client-bearer-token-auth] <br/> [HTTP Client with Self Signed JWT Auth][bbe-client-self-signed-jwt-auth] |
| [**oauth2**][oauth2] | [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-oauth2?label=)][oauth2-tags] <br/> [![build](https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/build-timestamped-master.yml/badge.svg)][oauth2-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2/branch/master/graph/badge.svg)][oauth2-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/oauth2.svg?label=Issues)][oauth2-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-oauth2?label=PRs)][oauth2-pulls] | [![OAuth2 API Docs][ballerina-docs-logo]][oauth2-docs] <br/> [![OAuth2 Package][ballerina-central-logo]][oauth2-package] | [HTTP Service with OAuth2][bbe-service-oauth2] <br/> [HTTP Client with OAuth2 Client Credentials Grant Type][bbe-client-oauth2-client-credentials-grant] <br/> [HTTP Client with OAuth2 Password Grant Type][bbe-client-oauth2-password-grant] <br/> [HTTP Client with OAuth2 Direct Token Type][bbe-client-oauth2-refresh-token-grant] |
| [**crypto**][crypto] | [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-crypto?label=)][crypto-tags] <br/> [![build](https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/build-timestamped-master.yml/badge.svg)][crypto-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-crypto/branch/master/graph/badge.svg)][crypto-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/crypto.svg?label=Issues)][crypto-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-crypto?label=PRs)][crypto-pulls] | [![Crypto API Docs][ballerina-docs-logo]][crypto-docs] <br/> [![Crypto Package][ballerina-central-logo]][crypto-package] | [Cryptographic Operations][bbe-crypto] |
| [**url**][url] | [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-url?label=)][url-tags] <br/> [![build](https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/build-timestamped-master.yml/badge.svg)][url-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-url/branch/master/graph/badge.svg)][url-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/url.svg?label=Issues)][url-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-url?label=PRs)][url-pulls] | [![URL API Docs][ballerina-docs-logo]][url-docs] <br/> [![URL Package][ballerina-central-logo]][url-package] | [URL Encode & Decode][bbe-url] |

## Test Suite

This section demonstrates an automated Ballerina security test-suite which contains authentication and authorization related integration scenarios and Ballerina by examples (BBEs). These tests run on-demand with the provided Ballerina version in GitHub secrets. Refer to the [test suite](./test-suite).

[![BBE](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/bbe.yml)
[![Integration](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml/badge.svg)](https://github.com/ldclakmal/ballerina-security/actions/workflows/integration.yml)

## Examples

This section demonstrates the examples with authentication and authorization for different transport protocols supported by Ballerina. The client and servers are secured with different auth protocols. Refer to the [examples](./examples).

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

[auth]: https://github.com/ballerina-platform/module-ballerina-auth
[auth-tags]: https://github.com/ballerina-platform/module-ballerina-auth/tags
[auth-build]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/build-timestamped-master.yml
[auth-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-auth
[auth-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fauth
[auth-pulls]: https://github.com/ballerina-platform/module-ballerina-auth/pulls
[auth-docs]: https://docs.central.ballerina.io/ballerina/auth/latest
[auth-package]: https://swanlake.central.ballerina.io/ballerina/auth

[jwt]: https://github.com/ballerina-platform/module-ballerina-jwt
[jwt-tags]: https://github.com/ballerina-platform/module-ballerina-jwt/tags
[jwt-build]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/build-timestamped-master.yml
[jwt-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-jwt
[jwt-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fjwt
[jwt-pulls]: https://github.com/ballerina-platform/module-ballerina-jwt/pulls
[jwt-docs]: https://docs.central.ballerina.io/ballerina/jwt/latest
[jwt-package]: https://swanlake.central.ballerina.io/ballerina/jwt

[oauth2]: https://github.com/ballerina-platform/module-ballerina-oauth2
[oauth2-tags]: https://github.com/ballerina-platform/module-ballerina-oauth2/tags
[oauth2-build]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/build-timestamped-master.yml
[oauth2-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2
[oauth2-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Foauth2
[oauth2-pulls]: https://github.com/ballerina-platform/module-ballerina-oauth2/pulls
[oauth2-docs]: https://docs.central.ballerina.io/ballerina/oauth2/latest
[oauth2-package]: https://swanlake.central.ballerina.io/ballerina/oauth2

[crypto]: https://github.com/ballerina-platform/module-ballerina-crypto
[crypto-tags]: https://github.com/ballerina-platform/module-ballerina-crypto/tags
[crypto-build]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/build-timestamped-master.yml
[crypto-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-crypto
[crypto-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fcrypto
[crypto-pulls]: https://github.com/ballerina-platform/module-ballerina-crypto/pulls
[crypto-docs]: https://docs.central.ballerina.io/ballerina/crypto/latest
[crypto-package]: https://swanlake.central.ballerina.io/ballerina/crypto

[url]: https://github.com/ballerina-platform/module-ballerina-url
[url-tags]: https://github.com/ballerina-platform/module-ballerina-url/tags
[url-build]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/build-timestamped-master.yml
[url-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-url
[url-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Furl
[url-pulls]: https://github.com/ballerina-platform/module-ballerina-url/pulls
[url-docs]: https://docs.central.ballerina.io/ballerina/url/latest
[url-package]: https://swanlake.central.ballerina.io/ballerina/url

[stdlib]: https://github.com/ballerina-platform/ballerina-standard-library
[http]: https://github.com/ballerina-platform/module-ballerina-http
[grpc]: https://github.com/ballerina-platform/module-ballerina-grpc
[websocket]: https://github.com/ballerina-platform/module-ballerina-websocket
[websub]: https://github.com/ballerina-platform/module-ballerina-websub
[graphql]: https://github.com/ballerina-platform/module-ballerina-graphql

[bbe-crypto]: https://ballerina.io/swan-lake/learn/by-example/crypto.html
[bbe-jwt]: https://ballerina.io/swan-lake/learn/by-example/jwt-issue-validate.html
[bbe-url]: https://ballerina.io/swan-lake/learn/by-example/url-encode-decode.html
[bbe-service-basic-auth-file]: https://ballerina.io/swan-lake/learn/by-example/http-service-with-basic-auth-file-user-store.html
[bbe-service-basic-auth-ldap]: https://ballerina.io/swan-lake/learn/by-example/http-service-with-basic-auth-ldap-user-store.html]
[bbe-service-jwt-auth]: https://ballerina.io/swan-lake/learn/by-example/http-service-with-jwt-auth.html
[bbe-service-oauth2]: https://ballerina.io/swan-lake/learn/by-example/http-service-with-oauth2.html
[bbe-client-basic-auth]: https://ballerina.io/swan-lake/learn/by-example/http-client-with-basic-auth.html
[bbe-client-bearer-token-auth]: https://ballerina.io/swan-lake/learn/by-example/http-client-with-bearer-token-auth.html
[bbe-client-self-signed-jwt-auth]: https://ballerina.io/swan-lake/learn/by-example/http-client-with-self-signed-jwt-auth.html
[bbe-client-oauth2-client-credentials-grant]: https://ballerina.io/swan-lake/learn/by-example/http-client-with-oauth2-client-credentials-grant-type.html
[bbe-client-oauth2-password-grant]: https://ballerina.io/swan-lake/learn/by-example/http-client-with-oauth2-password-grant-type.html
[bbe-client-oauth2-refresh-token-grant]: https://ballerina.io/swan-lake/learn/by-example/http-client-with-oauth2-direct-token-type.html

[ballerina-central-logo]: ./img/ballerina-central-logo.svg
[ballerina-docs-logo]: ./img/ballerina-docs-logo.svg