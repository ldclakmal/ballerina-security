# Ballerina Security Dashboard

## Status

#### Ballerina Platform

| Module | Master Build | Daily Build | Latest Release Tag |
|---|---|---|---|
| [ballerina-lang](https://github.com/ballerina-platform/ballerina-lang) | ![Build](https://github.com/ballerina-platform/ballerina-lang/workflows/CI%20Build/badge.svg) | ![Daily build](https://github.com/ballerina-platform/ballerina-lang/workflows/Ballerina%20daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/ballerina-lang) |
| [ballerina-distribution](https://github.com/ballerina-platform/ballerina-distribution) | ![Build](https://github.com/ballerina-platform/ballerina-distribution/workflows/Ballerina%20Distribution%20Build/badge.svg) | ![Daily build](https://github.com/ballerina-platform/ballerina-distribution/workflows/Daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/ballerina-distribution) |

#### Security Modules

| Module | Master Build & Daily Build | Latest Release Tag | Open Issues & PRs | Depends On | Unit Tests Depends On |
|---|---|---|---|---|---|
| [encoding](https://github.com/ballerina-platform/module-ballerina-encoding) | ![Build](https://github.com/ballerina-platform/module-ballerina-encoding/workflows/Build/badge.svg) ![Daily build](https://github.com/ballerina-platform/module-ballerina-encoding/workflows/Daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-encoding) | ![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/module-ballerina-encoding) ![GitHub pull requests](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-encoding) | **java** | **test**, [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils) |
| [crypto](https://github.com/ballerina-platform/module-ballerina-crypto) | ![Build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Build/badge.svg) ![Daily build](https://github.com/ballerina-platform/module-ballerina-crypto/workflows/Daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-crypto) | ![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/module-ballerina-crypto) ![GitHub pull requests](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-crypto) | **java**, [time](https://github.com/ballerina-platform/module-ballerina-time) | **test**, [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils) |
| [auth](https://github.com/ballerina-platform/module-ballerina-auth) | ![Build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Build/badge.svg) ![Daily build](https://github.com/ballerina-platform/module-ballerina-auth/workflows/Daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-auth) | ![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/module-ballerina-auth) ![GitHub pull requests](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-auth) | **java**, [cache](https://github.com/ballerina-platform/module-ballerina-cache), [config](https://github.com/ballerina-platform/module-ballerina-config), [crypto](https://github.com/ballerina-platform/module-ballerina-crypto), [log](https://github.com/ballerina-platform/module-ballerina-log), [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils) | **test** |
| [jwt](https://github.com/ballerina-platform/module-ballerina-jwt) | ![Build](https://github.com/ballerina-platform/module-ballerina-jwt/workflows/Build/badge.svg) ![Daily build](https://github.com/ballerina-platform/module-ballerina-jwt/workflows/Daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-jwt) | ![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/module-ballerina-jwt) ![GitHub pull requests](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-jwt) | [auth](https://github.com/ballerina-platform/module-ballerina-auth), [cache](https://github.com/ballerina-platform/module-ballerina-cache), [crypto](https://github.com/ballerina-platform/module-ballerina-crypto), [encoding](https://github.com/ballerina-platform/module-ballerina-encoding), [http](https://github.com/ballerina-platform/module-ballerina-http), [io](https://github.com/ballerina-platform/module-ballerina-io), [log](https://github.com/ballerina-platform/module-ballerina-log), [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils), [system](https://github.com/ballerina-platform/module-ballerina-system), [time](https://github.com/ballerina-platform/module-ballerina-time) | **test**, [crypto](https://github.com/ballerina-platform/module-ballerina-crypto), [encoding](https://github.com/ballerina-platform/module-ballerina-encoding), [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils), [time](https://github.com/ballerina-platform/module-ballerina-time) |
| [oauth2](https://github.com/ballerina-platform/module-ballerina-oauth2) | ![Build](https://github.com/ballerina-platform/module-ballerina-oauth2/workflows/Build/badge.svg) ![Daily build](https://github.com/ballerina-platform/module-ballerina-oauth2/workflows/Daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-oauth2) | ![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/module-ballerina-oauth2) ![GitHub pull requests](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-oauth2) | [auth](https://github.com/ballerina-platform/module-ballerina-auth), [cache](https://github.com/ballerina-platform/module-ballerina-cache), [http](https://github.com/ballerina-platform/module-ballerina-http), [log](https://github.com/ballerina-platform/module-ballerina-log), [mime](https://github.com/ballerina-platform/module-ballerina-mime), [stringutils](https://github.com/ballerina-platform/module-ballerina-stringutils), [time](https://github.com/ballerina-platform/module-ballerina-time) | - |
| [ldap](https://github.com/ballerina-platform/module-ballerina-ldap) | ![Build](https://github.com/ballerina-platform/module-ballerina-ldap/workflows/Build/badge.svg) ![Daily build](https://github.com/ballerina-platform/module-ballerina-ldap/workflows/Daily%20build/badge.svg) | ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ballerina-platform/module-ballerina-ldap) | ![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/module-ballerina-ldap) ![GitHub pull requests](https://img.shields.io/github/issues-pr/ballerina-platform/module-ballerina-ldap) | **java**, [auth](https://github.com/ballerina-platform/module-ballerina-auth), [crypto](https://github.com/ballerina-platform/module-ballerina-crypto), [log](https://github.com/ballerina-platform/module-ballerina-log) | - |

---

## BBEs

#### Language concepts -> Security

- [crypto](https://ballerina.io/swan-lake/learn/by-example/crypto.html)
- [jwt-issue-validate](https://ballerina.io/swan-lake/learn/by-example/jwt-issue-validate.html)
- [url-encode-decode](https://ballerina.io/swan-lake/learn/by-example/url-encode-decode.html)

#### Working over the networks -> Access Control

- [secured-service-with-basic-auth](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-basic-auth.html)
- [secured-service-with-jwt-auth](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-jwt-auth.html)
- [secured-service-with-oauth2](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-oauth2.html)
- [secured-service-with-ldap](https://ballerina.io/swan-lake/learn/by-example/secured-service-with-ldap.html)
- [secured-client-with-basic-auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-basic-auth.html)
- [secured-client-with-jwt-auth](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-jwt-auth.html)
- [secured-client-with-oauth2](https://ballerina.io/swan-lake/learn/by-example/secured-client-with-oauth2.html)

---

## Resources

1. https://ballerina.io/learn/writing-secure-ballerina-code/
