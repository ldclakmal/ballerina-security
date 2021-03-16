# Ballerina Security Examples

This directory contains the real-world scenarios written by [Ballerina](https://ballerina.io) programming language.

### [Scenario 1](./scenario-1)

Simple inventory management system, with 2 secured microservices, and a secured API gateway, which connects to an LDAP user store and trusts OAuth2 authorization server.

User `Jane`, the admin, connects to `Admin Microservice` through the REST API of API gateway using HTTPS for management purposes. User `Alice`, a customer, connects to `Inventory Microservice` through the REST API of API gateway using HTTPS for purchasing items. All the APIs are authenticated with different types of authentication mechanisms such as basic auth, JWT auth, OAuth2 etc. and secured with TLS as well. Refer to the [diagram](./scenario-1/scenario-1.png) and [README](./scenario-1/README.md) for more information.

### [Scenario 2](./scenario-2)

Extended inventory management system, with 4 secured microservices, and a secured API gateway, which connects to an LDAP user store and trusts OAuth2 authorization server.

User `Jane`, the admin, connects to `Admin Microservice` through the REST API of API gateway using HTTPS for management purposes. User `Alice`, a customer, connects to `Inventory Microservice` through the REST API of API gateway using HTTPS for purchasing items. User `Bob`, another customer, connects to `Inventory Microservice` through the GraphQL API of API gateway using HTTPS for searching items. `Electronic` and `Fashions` microservices are connected to `Inventory Microservice` and can be accessed via gRPC APIs. All the HTTP, GraphQL, gRPC APIs are authenticated with different types of authentication mechanisms such as basic auth, JWT auth, OAuth2 etc. and secured with TLS as well. Refer to the [diagram](./scenario-2/scenario-2.png) and [README](./scenario-2/README.md) for more information.
