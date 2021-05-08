# Ballerina STS

Ballerina Secure Token Service (STS) which supports OAuth2 token issuing and validation. This is published into Docker Hub as well.

![Docker Pulls](https://img.shields.io/docker/pulls/ldclakmal/ballerina-sts)

### How to run

In order to run this in local machine, we need to have [Ballerina Swan Lake Alpha 5](https://ballerina.io/downloads/) installed.

- Run as a container: `$ docker run -p 9090:9090 ldclakmal/ballerina-sts`
- Run using source code: `$ bal run ballerina-sts.bal`

### How to test

- Get an access-token with a scope:

    ```shell
    curl -kv -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" -d "grant_type=client_credentials&scope=view-order" https://localhost:9090/oauth2/token
    ```

- Refresh an access-token with a scope:

    ```shell
    curl -kv -u 3VTwFk7u1i366wzmvpJ_LZlfAV4a:TNOH0ZklJm8sqS9U3IMMAZVth78a -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" -d "grant_type=refresh_token&refresh_token=<ACCESS_TOKEN>&scope=view-order" https://localhost:9090/oauth2/token
    ```

- Validate an access-token:

    ```shell
    curl -kv -u admin:admin -H 'Content-Type: application/x-www-form-urlencoded' -X POST --data 'token=<ACCESS_TOKEN>' https://localhost:9090/oauth2/introspect
    ```