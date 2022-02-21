# FTP

### FTP Server

_docker-compose.yml_
```yaml
{{#include ../../../examples/ftp/resources/docker-compose.yml}}
```

```shell
$ docker-compose -f docker-compose.yml up
```

### SFTP Listener

_sftp_listener_credentials_auth.bal_
```ballerina
{{#include ../../../examples/ftp/sftp_listener_credentials_auth.bal}}
```

```shell
$ bal run sftp_listener_credentials_auth.bal
```

### SFTP Client

_sftp_client_credentials_auth.bal_
```ballerina
{{#include ../../../examples/ftp/sftp_client_credentials_auth.bal}}
```

```shell
$ bal run sftp_client_credentials_auth.bal
```

---

#### Resources

_private.key_
```
{{#include ../../../examples/ftp/resources/key/private.key}}
```
