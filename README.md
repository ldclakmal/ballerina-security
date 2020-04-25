# Ballerina Security Test Suite

This is a Ballerina security test suite which contains authentication and authorization related scenarios.

```shell
$ cd ./ballerina-testgrid-suite/src/main/resources/ballerina-security

$ ballerina run auth --b7a.config.file=src/auth/resources/users.toml

    [ballerina/http] started HTTPS/WSS listener 0.0.0.0:9090
    [ballerina/http] started HTTPS/WSS listener 0.0.0.0:9091
    [ballerina/http] started HTTPS/WSS listener 0.0.0.0:9191
    [ballerina/http] started HTTPS/WSS listener 0.0.0.0:9092
```

```shell
$ curl -k https://localhost:9090/hello/sayHello -u tom:123

    Successful!
```
