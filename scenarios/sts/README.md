# Ballerina STS

#### Important Links
- [**Source Code**](https://github.com/ldclakmal/ballerina-security/tree/master/scenarios/sts/ballerina-sts.bal)

## Overview

Ballerina Secure Token Service (STS) which supports OAuth2 token issuing and validation.
This is published into Docker Hub as well.

[![Docker Pulls](https://img.shields.io/docker/pulls/ldclakmal/ballerina-sts)](https://hub.docker.com/r/ldclakmal/ballerina-sts)

### Start

To start STS in a local machine, we need to have [Ballerina 2201.0.0 (Swan Lake)](https://ballerina.io/downloads/) or 
later version installed.

- Run as a container
  ```shell
  $ docker run -p 9445:9445 ldclakmal/ballerina-sts:latest
  ```
  
- Run using source code
  ```shell
  $ bal run
  ```


### Test

- Get an access token with a scope:
  ```shell
  $ curl -k -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa \
  -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
  -d "grant_type=client_credentials&scope=view-order" \
  https://localhost:9445/oauth2/token
  ```

- Refresh an access token with a scope:
  ```shell
  $ curl -k -u FlfJYKBD2c925h4lkycqNZlC2l4a:PJz0UhTJMrHOo68QQNpvnqAY_3Aa \
  -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
  -d "grant_type=refresh_token&refresh_token=<ACCESS_TOKEN>&scope=view-order" \
  https://localhost:9445/oauth2/token
  ```

- Validate an access token:
  ```shell
  $ curl -k -u admin:admin -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'token=<ACCESS_TOKEN>' \
  https://localhost:9445/oauth2/introspect
  ```
