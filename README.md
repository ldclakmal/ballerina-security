<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-69533863-9"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-69533863-9');
</script>
<link rel="shortcut icon" type="image/png" href="img/favicon.png?v=1.0">

![Ballerina](./img/ballerina-cover.png)

## Ballerina Security Resources

#### Guides & Documentations

- [Authentication and Authorization - Swan Lake](https://ballerina.io/swan-lake/learn/security/authentication-and-authorization/)
- [Authentication and Authorization - 1.2.x](https://ballerina.io/1.2/learn/writing-secure-ballerina-code/)

#### Research & Design

- 2021 Feb - [[Re-Design] Ballerina SecureSocket API](https://docs.google.com/document/d/1Y2kLTOw9-sRK1vSEzw5NYdWSA4nwVCvPf3wrbwNDA4s/edit?usp=sharing)
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
- [Secured Service with Basic Auth LDAP User Store](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-basic-auth-ldap-user-store.html)
- [Secured Service with JWT Auth](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-jwt-auth.html)
- [Secured Service with OAuth2](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-oauth2.html)
- [Secured Client with Basic Auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-basic-auth.html)
- [Secured Client with Bearer Token Auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-bearer-token-auth.html)
- [Secured Client with Self Signed JWT Auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-self-signed-jwt-auth.html)
- [Secured Client with OAuth2 Client Credentials Grant Type](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-oauth2-client-credentials-grant-type.html)
- [Secured Client with OAuth2 Password Grant Type](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-oauth2-password-grant-type.html)
- [Secured Client with OAuth2 Direct Token Type](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-oauth2-direct-token-type.html)

--- 
## Ballerina Security Dashboard

| Module | Status | Issues & PRs | Dependencies |
|---|---|---|---|
| [**auth**][auth] <br/> [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-auth?label=)][auth-tags] | [![build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg)][auth-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-auth/branch/master/graph/badge.svg)][auth-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/auth.svg?label=Issues)][auth-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-auth?label=PRs)][auth-pulls] | [![cache](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-cache/Build?label=Cache)][cache] [![crypto](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-crypto/Build?label=Crypto)][crypto] [![log](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-log/Build?label=Log)][log] [![regex](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-regex/Build?label=Regex)][regex] [![task](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-task/Build?label=Task*)][task] [![time](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-time/Build?label=Time*)][time] |
| [**jwt**][jwt] <br/> [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-jwt?label=)][jwt-tags] | [![build](https://github.com/ballerina-platform/module-ballerina-jwt/workflows/Build/badge.svg)][jwt-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-jwt/branch/master/graph/badge.svg)][jwt-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/jwt.svg?label=Issues)][jwt-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-jwt?label=PRs)][jwt-pulls] | [![cache](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-cache/Build?label=Cache)][cache] [![crypto](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-crypto/Build?label=Crypto)][crypto] [![log](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-log/Build?label=Log)][log] [![regex](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-regex/Build?label=Regex)][regex] [![time](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-time/Build?label=Time)][time] [![task](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-task/Build?label=Task*)][task] |
| [**oauth2**][oauth2] <br/> [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-oauth2?label=)][oauth2-tags] | [![build](https://github.com/ballerina-platform/module-ballerina-oauth2/workflows/Build/badge.svg)][oauth2-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2/branch/master/graph/badge.svg)][oauth2-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/oauth2.svg?label=Issues)][oauth2-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-oauth2?label=PRs)][oauth2-pulls] | [![cache](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-cache/Build?label=Cache)][cache] [![crypto](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-crypto/Build?label=Crypto)][crypto] [![log](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-log/Build?label=Log)][log] [![regex](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-regex/Build?label=Regex)][regex] [![time](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-time/Build?label=Time)][time] [![task](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-task/Build?label=Task*)][task] |
| [**crypto**][crypto] <br/> [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-crypto?label=)][crypto-tags] | [![build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg)][crypto-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-crypto/branch/master/graph/badge.svg)][crypto-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/crypto.svg?label=Issues)][crypto-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-crypto?label=PRs)][crypto-pulls] | [![time](https://img.shields.io/github/workflow/status/ballerina-platform/module-ballerina-time/Build?label=Time)][time] |
| [**url**][url] <br/> [![tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-url?label=)][url-tags] | [![build](https://github.com/ballerina-platform/module-ballerina-url/workflows/Build/badge.svg)][url-build] <br/> [![codecov](https://codecov.io/gh/ballerina-platform/module-ballerina-url/branch/master/graph/badge.svg)][crypto-codecov] | [![issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/url.svg?label=Issues)][crypto-issues] <br/> [![pulls](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-url?label=PRs)][crypto-pulls] | |

[auth]: https://github.com/ballerina-platform/module-ballerina-auth
[auth-tags]: https://github.com/ballerina-platform/module-ballerina-auth/tags
[auth-build]: https://github.com/ballerina-platform/module-ballerina-auth/actions/workflows/build-master.yml
[auth-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-auth
[auth-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fauth
[auth-pulls]: https://github.com/ballerina-platform/module-ballerina-auth/pulls

[jwt]: https://github.com/ballerina-platform/module-ballerina-jwt
[jwt-tags]: https://github.com/ballerina-platform/module-ballerina-jwt/tags
[jwt-build]: https://github.com/ballerina-platform/module-ballerina-jwt/actions/workflows/build-master.yml
[jwt-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-jwt
[jwt-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fjwt
[jwt-pulls]: https://github.com/ballerina-platform/module-ballerina-jwt/pulls

[oauth2]: https://github.com/ballerina-platform/module-ballerina-oauth2
[oauth2-tags]: https://github.com/ballerina-platform/module-ballerina-oauth2/tags
[oauth2-build]: https://github.com/ballerina-platform/module-ballerina-oauth2/actions/workflows/build-master.yml
[oauth2-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-oauth2
[oauth2-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Foauth2
[oauth2-pulls]: https://github.com/ballerina-platform/module-ballerina-oauth2/pulls

[crypto]: https://github.com/ballerina-platform/module-ballerina-crypto
[crypto-tags]: https://github.com/ballerina-platform/module-ballerina-crypto/tags
[crypto-build]: https://github.com/ballerina-platform/module-ballerina-crypto/actions/workflows/build-master.yml
[crypto-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-crypto
[crypto-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fcrypto
[crypto-pulls]: https://github.com/ballerina-platform/module-ballerina-crypto/pulls

[url]: https://github.com/ballerina-platform/module-ballerina-url
[url-tags]: https://github.com/ballerina-platform/module-ballerina-url/tags
[url-build]: https://github.com/ballerina-platform/module-ballerina-url/actions/workflows/build-master.yml
[url-codecov]: https://codecov.io/gh/ballerina-platform/module-ballerina-url
[url-issues]: https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Furl
[url-pulls]: https://github.com/ballerina-platform/module-ballerina-url/pulls

[cache]: https://github.com/ballerina-platform/module-ballerina-cache
[crypto]: https://github.com/ballerina-platform/module-ballerina-crypto
[log]: https://github.com/ballerina-platform/module-ballerina-log
[regex]: https://github.com/ballerina-platform/module-ballerina-regex
[task]: https://github.com/ballerina-platform/module-ballerina-task
[time]: https://github.com/ballerina-platform/module-ballerina-time
