<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-69533863-9"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-69533863-9');
</script>
<link rel="shortcut icon" type="image/png" href="favicon.png?v=1.0">

## Dashboard

#### Security Modules

| Module & Latest Tag | Build Status | Open Issues | Open PRs | Directly Depends | Build Status | Transitively Depends | Build Status | Test Depends |
|---|---|---|---|---|---|---|---|---|
| [**encoding**](https://github.com/ballerina-platform/module-ballerina-encoding) <br/> ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-encoding?label=) | ![Build](https://github.com/ballerina-platform/module-ballerina-encoding/workflows/Build/badge.svg) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/encoding.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fencoding) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-encoding?label=)](https://github.com/ballerina-platform/module-ballerina-encoding/pulls) | **java** | | | | **test** |
| [**crypto**](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-crypto?label=) | ![Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/crypto.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fcrypto) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-crypto?label=)](https://github.com/ballerina-platform/module-ballerina-crypto/pulls) | **java** <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) | <br/> ![Time Build](https://github.com/ballerina-platform/module-ballerina-time/workflows/Build/badge.svg) | | | **test** |
| [**auth**](https://github.com/ballerina-platform/module-ballerina-auth) <br/> ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-auth?label=) | ![Build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/auth.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fauth) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-auth?label=)](https://github.com/ballerina-platform/module-ballerina-auth/pulls) | **java** <br/> [cache](https://github.com/ballerina-platform/module-ballerina-cache) <br/> [config](https://github.com/ballerina-platform/module-ballerina-config) <br/> [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> [log](https://github.com/ballerina-platform/module-ballerina-log) <br/> [regex](https://github.com/ballerina-platform/module-ballerina-regex) | <br/> ![Cache Build](https://github.com/ballerina-platform/module-ballerina-cache/workflows/Build/badge.svg) <br/> ![Config Build](https://github.com/ballerina-platform/module-ballerina-config/workflows/Build/badge.svg) <br/> ![Crypto Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) <br/> ![Log Build](https://github.com/ballerina-platform/module-ballerina-log/workflows/Build/badge.svg) <br/> ![Regex Build](https://github.com/ballerina-platform/module-ballerina-regex/workflows/Build/badge.svg) | [io](https://github.com/ballerina-platform/module-ballerina-io) <br/> [os](https://github.com/ballerina-platform/module-ballerina-os) <br/> [task](https://github.com/ballerina-platform/module-ballerina-task) <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) | ![Build](https://github.com/ballerina-platform/module-ballerina-io/workflows/Build/badge.svg) <br/> ![Build](https://github.com/ballerina-platform/module-ballerina-os/workflows/Build/badge.svg) <br/> ![Build](https://github.com/ballerina-platform/module-ballerina-task/workflows/Build/badge.svg) <br/> ![Build](https://github.com/ballerina-platform/module-ballerina-time/workflows/Build/badge.svg) | **test** |
| [**jwt**](https://github.com/ballerina-platform/module-ballerina-jwt) <br/> ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-jwt?label=) | ![Build](https://github.com/ballerina-platform/module-ballerina-jwt/workflows/Build/badge.svg) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/jwt.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fjwt) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-jwt?label=)](https://github.com/ballerina-platform/module-ballerina-jwt/pulls) | **java** <br/> [cache](https://github.com/ballerina-platform/module-ballerina-cache) <br/> [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> [encoding](https://github.com/ballerina-platform/module-ballerina-encoding) <br/> [log](https://github.com/ballerina-platform/module-ballerina-log) <br/> [regex](https://github.com/ballerina-platform/module-ballerina-regex) <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) <br/> [uuid](https://github.com/ballerina-platform/module-ballerina-uuid) | <br/> ![Cache Build](https://github.com/ballerina-platform/module-ballerina-cache/workflows/Build/badge.svg) <br/> ![Crypto Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) <br/> ![Encoding Build](https://github.com/ballerina-platform/module-ballerina-encoding/workflows/Build/badge.svg) <br/> ![Log Build](https://github.com/ballerina-platform/module-ballerina-log/workflows/Build/badge.svg) <br/> ![Regex Build](https://github.com/ballerina-platform/module-ballerina-regex/workflows/Build/badge.svg) <br/> ![Time Build](https://github.com/ballerina-platform/module-ballerina-time/workflows/Build/badge.svg) <br/> ![UUID Build](https://github.com/ballerina-platform/module-ballerina-uuid/workflows/Build/badge.svg) | [task](https://github.com/ballerina-platform/module-ballerina-task) | ![Build](https://github.com/ballerina-platform/module-ballerina-task/workflows/Build/badge.svg) | **test** <br/> [encoding](https://github.com/ballerina-platform/module-ballerina-encoding) <br/> [regex](https://github.com/ballerina-platform/module-ballerina-regex) |
| [**oauth2**](https://github.com/ballerina-platform/module-ballerina-oauth2) <br/> ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-oauth2?label=) | ![Build](https://github.com/ballerina-platform/module-ballerina-oauth2/workflows/Build/badge.svg) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/oauth2.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Foauth2) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-oauth2?label=)](https://github.com/ballerina-platform/module-ballerina-oauth2/pulls) | **java** <br/> [cache](https://github.com/ballerina-platform/module-ballerina-cache) <br/> [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> [log](https://github.com/ballerina-platform/module-ballerina-log) <br/> [regex](https://github.com/ballerina-platform/module-ballerina-regex) <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) | <br/> ![Cache Build](https://github.com/ballerina-platform/module-ballerina-cache/workflows/Build/badge.svg) <br/> ![Crypto Build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg) <br/> ![Log Build](https://github.com/ballerina-platform/module-ballerina-log/workflows/Build/badge.svg) <br/> ![Regex Build](https://github.com/ballerina-platform/module-ballerina-regex/workflows/Build/badge.svg) <br/> ![Time Build](https://github.com/ballerina-platform/module-ballerina-time/workflows/Build/badge.svg) | [task](https://github.com/ballerina-platform/module-ballerina-task) | ![Build](https://github.com/ballerina-platform/module-ballerina-task/workflows/Build/badge.svg) | - |

#### Ballerina Platform

| Module | Master Build | Latest Release | Last Commit | Open Issues | Open PRs |
|---|---|---|---|---|---|
| [ballerina-lang](https://github.com/ballerina-platform/ballerina-lang) | ![Build](https://github.com/ballerina-platform/ballerina-lang/workflows/CI%20Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/ballerina-lang?label=) | ![Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/ballerina-lang.svg?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-lang?label=)](https://github.com/ballerina-platform/ballerina-lang/issues?q=is%3Aissue+is%3Aopen) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/ballerina-lang?label=)](https://github.com/ballerina-platform/ballerina-lang/pulls?q=is%3Apr+is%3Aopen) |
| [ballerina-distribution](https://github.com/ballerina-platform/ballerina-distribution) | ![Build](https://github.com/ballerina-platform/ballerina-distribution/workflows/Ballerina%20Distribution%20Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/ballerina-distribution?label=) | ![Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/ballerina-distribution.svg?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-distribution?label=)](https://github.com/ballerina-platform/ballerina-distribution/issues?q=is%3Aissue+is%3Aopen) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/ballerina-distribution?label=)](https://github.com/ballerina-platform/ballerina-distribution/pulls?q=is%3Apr+is%3Aopen) |
| [ballerina-standard-library](https://github.com/ballerina-platform/ballerina-standard-library) | | | ![Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/ballerina-distribution.svg?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aissue+is%3Aopen) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/ballerina-standard-library?label=)](https://github.com/ballerina-platform/ballerina-standard-library/pulls?q=is%3Apr+is%3Aopen) |

---

## Resources

#### Guides

- [Writing Secure Ballerina Code](https://ballerina.io/learn/writing-secure-ballerina-code/)

#### Documents

- 2020 Nov - [[Design] Ballerina Authn/Authz - Swan Lake Release](https://docs.google.com/document/d/1dGw5uUP6kqZNTwMfQ_Ik-k0HTMKhX70XpEA3tys9_kk/edit?usp=sharing)
- 2020 Oct - [[Research] Comparison on Ballerina Security Features/APIs](https://docs.google.com/spreadsheets/d/1PyMAlAvgkEL0RpW8CVUj1ccW_61Vm6SMbvadFVYRpSA/edit?usp=sharing)
- 2018 Apr - [Ballerina HTTP Service Authentication and Secure HTTP Clients Design](https://docs.google.com/document/d/1GR-z2aNTFybY1LBquxKPvN3J-kWdEL2Y4_X7S570BOU/edit?usp=sharing)

#### Discussions [ballerina-dev@googlegroups.com]

- 2020 Apr - [Support JWT Signature Validation with JWKs](https://groups.google.com/g/ballerina-dev/c/lk3QnvBeT0c/m/b_Apt5wGBgAJ)
- 2019 Aug - [Redundant APIs for Encoding/Decoding](https://groups.google.com/g/ballerina-dev/c/sbASEwIl44k/m/0YlP3IcXFwAJ)
- 2019 Jun - [Refactor Ballerina Outbound Authentication](https://groups.google.com/g/ballerina-dev/c/OvlUscsjT-I/m/VmTTBg-DBAAJ)
- 2019 May - [Update Module Structure for Ballerina Inbound Authentication](https://groups.google.com/g/ballerina-dev/c/7SYDiKeF8p8/m/3GNncS9dAwAJ)
- 2019 May - [Ballerina Inbound Authentication](https://groups.google.com/g/ballerina-dev/c/U3-GY9Q49eQ/m/HAcrWb-qAgAJ)
- 2018 Apr - [Securely invoking an HTTP endpoint with AuthConfig](https://groups.google.com/g/ballerina-dev/c/1q657E_wegQ/m/fjFkg9YnAgAJ)

#### GitHub Pull Requests

- 2020 Apr - [Implement JWT signature validation with JWKs](https://github.com/ballerina-platform/ballerina-lang/pull/22982)
- 2020 Apr - [Add API to generate public key from JWKs parameters](https://github.com/ballerina-platform/ballerina-lang/pull/22890)
- 2019 Aug - [Remove redundant APIs and replace usages of Encoding module](https://github.com/ballerina-platform/ballerina-lang/pull/18309)
- 2019 Jun - [Refactor outbound authentication with custom providers and handlers](https://github.com/ballerina-platform/ballerina-lang/pull/15696)
- 2019 Jun - [Implement OAuth2 Inbound Authentication](https://github.com/ballerina-platform/ballerina-lang/pull/15489)
- 2019 Jun - [Refactor Modules for Inbound Authentication](https://github.com/ballerina-platform/ballerina-lang/pull/15435)
- 2019 May - [Introduce Configuration Pattern for Authn Handlers and Scopes](https://github.com/ballerina-platform/ballerina-lang/pull/15363)
- 2019 May - [Improve HTTP secure client for OAuth2 grant types](https://github.com/ballerina-platform/ballerina-lang/pull/14419)
- 2019 May - [Refactor inbound authentication with custom provider and handlers](https://github.com/ballerina-platform/ballerina-lang/pull/15056)

#### Specifications

- [RFC 8693 - OAuth 2.0 Token Exchange](https://tools.ietf.org/html/rfc8693)
- [RFC 7662 - OAuth 2.0 Token Introspection](https://tools.ietf.org/html/rfc7662)
- [RFC 7519 - JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519)
- [RFC 7518 - JSON Web Algorithms (JWA)](https://tools.ietf.org/html/rfc7518)
- [RFC 7517 - JSON Web Key (JWK)](https://tools.ietf.org/html/rfc7517)
- [RFC 7516 - JSON Web Encryption (JWE)](https://tools.ietf.org/html/rfc7516)
- [RFC 7515 - JSON Web Signature (JWS)](https://tools.ietf.org/html/rfc7515)
- [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)

#### Ballerina by Examples (BBEs)

###### Language concepts -> Security

- [Crypto](https://ballerina.io/swan-lake/learn/by-example/crypto.html)
- [JWT Issue/Validate](https://ballerina.io/swan-lake/learn/by-example/jwt-issue-validate.html)
- [URL Encode/Decode](https://ballerina.io/swan-lake/learn/by-example/url-encode-decode.html)

###### Working over the networks -> Access Control
- [Secured Service with Basic Auth](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-basic-auth.html)
- [Secured Service with JWT Auth](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-jwt-auth.html)
- [Secured Service with OAuth2](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-oauth2.html)
- [Secured Service with LDAP](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-ldap.html) 
- [Secured Client with Basic Auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-basic-auth.html)
- [Secured Client with JWT Auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-jwt-auth.html)
- [Secured Client with OAuth2](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-oauth2.html)
