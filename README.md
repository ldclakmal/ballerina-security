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

#### Ballerina Platform

| Module | Master Build | Latest Release | Last Commit | Open Issues | Open PRs |
|---|---|---|---|---|---|
| [ballerina-lang](https://github.com/ballerina-platform/ballerina-lang) | ![Build](https://github.com/ballerina-platform/ballerina-lang/workflows/CI%20Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/ballerina-lang?label=) | ![Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/ballerina-lang.svg?label=) | ![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-lang?label=) | ![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/ballerina-lang?label=) |
| [ballerina-distribution](https://github.com/ballerina-platform/ballerina-distribution) | ![Build](https://github.com/ballerina-platform/ballerina-distribution/workflows/Ballerina%20Distribution%20Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/ballerina-distribution?label=) | ![Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/ballerina-distribution.svg?label=) | ![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-distribution?label=) | ![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/ballerina-distribution?label=)
| [ballerina-standard-library](https://github.com/ballerina-platform/ballerina-standard-library) | | | ![Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/ballerina-distribution.svg?label=) | ![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library?label=) | ![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/ballerina-standard-library?label=)

#### Security Modules

| Module | Build | Latest Release | Open Issues | Open PRs | Depends On | | Unit Tests Depends On |
|---|---|---|---|---|---|---|---|
| [**encoding**](https://github.com/ballerina-platform/module-ballerina-encoding) | ![Build](https://github.com/ballerina-platform/module-ballerina-encoding/workflows/Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-encoding?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/encoding.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fencoding) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-encoding?label=)](https://github.com/ballerina-platform/module-ballerina-encoding/pulls) | **java** | | **test** |
| [**crypto**](https://github.com/ballerina-platform/module-ballerina-crypto) | ![Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-crypto?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/crypto.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fcrypto) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-crypto?label=)](https://github.com/ballerina-platform/module-ballerina-crypto/pulls) | **java** <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) | <br/> ![Time Build](https://github.com/ballerina-platform/module-ballerina-time/workflows/Build/badge.svg) | **test** |
| [**auth**](https://github.com/ballerina-platform/module-ballerina-auth) | ![Build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-auth?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/auth.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fauth) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-auth?label=)](https://github.com/ballerina-platform/module-ballerina-auth/pulls) | **java** <br/> [cache](https://github.com/ballerina-platform/module-ballerina-cache) <br/> [config](https://github.com/ballerina-platform/module-ballerina-config) <br/> [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> [log](https://github.com/ballerina-platform/module-ballerina-log) <br/> [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils) | <br/> ![Cache Build](https://github.com/ballerina-platform/module-ballerina-cache/workflows/Build/badge.svg) <br/> ![Config Build](https://github.com/ballerina-platform/module-ballerina-config/workflows/Build/badge.svg) <br/> ![Crypto Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) <br/> ![Log Build](https://github.com/ballerina-platform/module-ballerina-log/workflows/Build/badge.svg) <br/> ![StringUtils Build](https://github.com/ballerina-platform/module-ballerina-stringutils/workflows/Build/badge.svg) | **test** |
| [**jwt**](https://github.com/ballerina-platform/module-ballerina-jwt) | ![Build](https://github.com/ballerina-platform/module-ballerina-jwt/workflows/Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-jwt?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/jwt.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fjwt) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-jwt?label=)](https://github.com/ballerina-platform/module-ballerina-jwt/pulls) | [auth](https://github.com/ballerina-platform/module-ballerina-auth) <br/> [cache](https://github.com/ballerina-platform/module-ballerina-cache) <br/> [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> [encoding](https://github.com/ballerina-platform/module-ballerina-encoding) <br/> [http](https://github.com/ballerina-platform/module-ballerina-http) <br/> [io](https://github.com/ballerina-platform/module-ballerina-io) <br/> [log](https://github.com/ballerina-platform/module-ballerina-log) <br/> [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils) <br/> [system](https://github.com/ballerina-platform/module-ballerina-system) <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) | ![Auth Build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg) <br/> ![Cache Build](https://github.com/ballerina-platform/module-ballerina-cache/workflows/Build/badge.svg) <br/> ![Crypto Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) <br/> ![Encoding Build](https://github.com/ballerina-platform/module-ballerina-encoding/workflows/Build/badge.svg) <br/> ![HTTP Build](https://github.com/ballerina-platform/module-ballerina-http/workflows/Build/badge.svg) <br/> ![IO Build](https://github.com/ballerina-platform/module-ballerina-io/workflows/Build/badge.svg) <br/> ![Log Build](https://github.com/ballerina-platform/module-ballerina-log/workflows/Build/badge.svg) <br/> ![StringUtils Build](https://github.com/ballerina-platform/module-ballerina-stringutils/workflows/Build/badge.svg) <br/> ![System Build](https://github.com/ballerina-platform/module-ballerina-system/workflows/Build/badge.svg) <br/> ![Time Build](https://github.com/ballerina-platform/module-ballerina-time/workflows/Build/badge.svg) | **test** <br/> [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> [encoding](https://github.com/ballerina-platform/module-ballerina-encoding) <br/> [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils) <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) |
| [**oauth2**](https://github.com/ballerina-platform/module-ballerina-oauth2) | ![Build](https://github.com/ballerina-platform/module-ballerina-oauth2/workflows/Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-oauth2?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/oauth2.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Foauth2) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-oauth2?label=)](https://github.com/ballerina-platform/module-ballerina-oauth2/pulls) | [auth](https://github.com/ballerina-platform/module-ballerina-auth) <br/> [cache](https://github.com/ballerina-platform/module-ballerina-cache) <br/> [http](https://github.com/ballerina-platform/module-ballerina-http) <br/> [log](https://github.com/ballerina-platform/module-ballerina-log) <br/> [mime](https://github.com/ballerina-platform/module-ballerina-mime) <br/> [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils) <br/> [time](https://github.com/ballerina-platform/module-ballerina-time) | ![Auth Build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg) <br/> ![Cache Build](https://github.com/ballerina-platform/module-ballerina-cache/workflows/Build/badge.svg) <br/> ![HTTP Build](https://github.com/ballerina-platform/module-ballerina-http/workflows/Build/badge.svg) <br/> ![Log Build](https://github.com/ballerina-platform/module-ballerina-log/workflows/Build/badge.svg) <br/> ![MIME Build](https://github.com/ballerina-platform/module-ballerina-mime/workflows/Build/badge.svg) <br/> ![StringUtils Build](https://github.com/ballerina-platform/module-ballerina-stringutils/workflows/Build/badge.svg) <br/> ![Time Build](https://github.com/ballerina-platform/module-ballerina-time/workflows/Build/badge.svg) | - |
| [**ldap**](https://github.com/ballerina-platform/module-ballerina-ldap) | ![Build](https://github.com/ballerina-platform/module-ballerina-ldap/workflows/Build/badge.svg) | ![Tag](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-ldap?label=) | [![Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/ldap.svg?label=)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Amodule%2Fldap) | [![PRs](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-ldap?label=)](https://github.com/ballerina-platform/module-ballerina-ldap/pulls) | **java** <br/> [auth](https://github.com/ballerina-platform/module-ballerina-auth) <br/> [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) <br/> [log](https://github.com/ballerina-platform/module-ballerina-log) | <br/> ![Auth Build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg) <br/> ![Crypto Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) <br/> ![Log Build](https://github.com/ballerina-platform/module-ballerina-log/workflows/Build/badge.svg) | - |

---

### Ballerina By Examples (BBEs)

| Language concepts -> Security | Working over the networks -> Access Control |
|---|---|
| [crypto](https://ballerina.io/swan-lake/learn/by-example/crypto.html) | [secured-service-with-basic-auth](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-basic-auth.html) |
| [jwt-issue-validate](https://ballerina.io/swan-lake/learn/by-example/jwt-issue-validate.html) | [secured-service-with-jwt-auth](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-jwt-auth.html) |
| [url-encode-decode](https://ballerina.io/swan-lake/learn/by-example/url-encode-decode.html) | [secured-service-with-oauth2](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-oauth2.html) |
| | [secured-service-with-ldap](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-ldap.html) |
| | [secured-client-with-basic-auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-basic-auth.html) |
| | [secured-client-with-jwt-auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-jwt-auth.html) |
| | [secured-client-with-oauth2](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-oauth2.html) |

---

### Resources

#### Guides

- [Writing Secure Ballerina Code](https://ballerina.io/learn/writing-secure-ballerina-code/)

#### Documents

- 2020 Nov [[Research][Design] Ballerina Auth Compatibility with StdLib Protocols](https://docs.google.com/document/d/1waLC1atImzKWzatNcrLdKKuxAO3b32hvDZKqp3k6BzQ/edit?usp=sharing)
- 2020 Nov [[Design] Ballerina Authn/Authz - Swan Lake Release](https://docs.google.com/document/d/1dGw5uUP6kqZNTwMfQ_Ik-k0HTMKhX70XpEA3tys9_kk/edit?usp=sharing)
- 2020 Oct [[Research] Comparison on Ballerina Security Features/APIs](https://docs.google.com/spreadsheets/d/1PyMAlAvgkEL0RpW8CVUj1ccW_61Vm6SMbvadFVYRpSA/edit?usp=sharing)
- 2018 Apr [Ballerina HTTP Service Authentication and Secure HTTP Clients Design](https://docs.google.com/document/d/1GR-z2aNTFybY1LBquxKPvN3J-kWdEL2Y4_X7S570BOU/edit?usp=sharing)
