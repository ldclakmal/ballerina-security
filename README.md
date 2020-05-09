[![Build Status](https://travis-ci.com/ldclakmal/ballerina-security-test-suite.svg?branch=master)](https://travis-ci.com/ldclakmal/ballerina-security-test-suite)

# Ballerina Security Test Suite

This is an automated Ballerina security test suite which contains authentication and authorization related scenarios. These tests run periodically with the latest Ballerina version.

- Secured services
    - Basic Auth secured service
    - JWT Auth secured service
    - OAuth2 secured service
    - LDAP Auth secured service

---

##### TODO:

- Add test cases for secured clients
- Add test cases of following pattern for each auth scheme
  - authn success
    - authz success
    - authz failure
  - authn failure
- Run the test suite with ballerina daily builds
