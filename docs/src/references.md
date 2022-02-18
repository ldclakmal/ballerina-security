# References

The following sections have important references which were used for the design and implementation of the current Ballerina Security model and its related components. All the references are open source and publicly available.

### Research & Design

- 2021 Sep - [[Design] Ballerina GraphQL Authentication and Authorization](https://docs.google.com/document/d/1ebwR5qXosyKjT7tSr4HgcYDq1vFsuzQxtiMgdET1G0o/edit?usp=sharing)
- 2021 Apr - [[Review] Ballerina Security APIs of StdLib Protocol Connector Module](https://docs.google.com/document/d/16r_gjBi7SIqVffKVLtKGBevHQRxp7Fnoo9ELyIWV1BM/edit?usp=sharing)
- 2021 Feb - [[Re-Design] Ballerina SecureSocket API](https://docs.google.com/document/d/1Y2kLTOw9-sRK1vSEzw5NYdWSA4nwVCvPf3wrbwNDA4s/edit?usp=sharing)
- 2020 Nov - [[Design] Ballerina Authentication & Authorization Framework](https://docs.google.com/document/d/1dGw5uUP6kqZNTwMfQ_Ik-k0HTMKhX70XpEA3tys9_kk/edit?usp=sharing)
- 2020 Oct - [[Research] Comparison on Ballerina Security Features/APIs with Programming Languages](https://docs.google.com/spreadsheets/d/1PyMAlAvgkEL0RpW8CVUj1ccW_61Vm6SMbvadFVYRpSA/edit?usp=sharing)

### Security Blogs

- 2021 Oct - [Securing Microservices with JWT](https://medium.com/@ldclakmal/securing-microservices-with-jwt-a16b738b110f)
- 2021 Aug - [Microservices Security with Ballerina](https://medium.com/@ldclakmal/microservices-security-with-ballerina-e9d430f05373)
- 2021 Aug - [HTTP Security in Ballerina](https://medium.com/@ldclakmal/http-security-in-ballerina-b0b5927866f9)

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

### Specifications

- [RFC 8693 - OAuth 2.0 Token Exchange](https://tools.ietf.org/html/rfc8693)
- [RFC 7662 - OAuth 2.0 Token Introspection](https://tools.ietf.org/html/rfc7662)
- [RFC 7519 - JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519)
- [RFC 7518 - JSON Web Algorithms (JWA)](https://tools.ietf.org/html/rfc7518)
- [RFC 7517 - JSON Web Key (JWK)](https://tools.ietf.org/html/rfc7517)
- [RFC 7516 - JSON Web Encryption (JWE)](https://tools.ietf.org/html/rfc7516)
- [RFC 7515 - JSON Web Signature (JWS)](https://tools.ietf.org/html/rfc7515)
- [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)
- [RFC 7617 - The 'Basic' HTTP Authentication Scheme](https://tools.ietf.org/html/rfc7617)

### Guides

- [Ballerina HTTP Listener Auth](https://ldclakmal.me/ballerina-security/guides/ballerina-http-listener-auth.html)
- [Ballerina HTTP Client Auth](https://ldclakmal.me/ballerina-security/guides/ballerina-http-client-auth.html)
- [How to obtain Google OAuth2.0 Credentials](https://ldclakmal.me/ballerina-security/guides/how-to-obtain-google-oauth2-credentials.html)
- [How to obtain Twilio Credentials](https://ldclakmal.me/ballerina-security/guides/how-to-obtain-twilio-credentials.html)
- [How to Start OpenLDAP Server with User Data](https://ldclakmal.me/ballerina-security/guides/how-to-start-open-ldap-server.html)
- [Cryptography](https://ldclakmal.me/ballerina-security/guides/cryptography.html)
