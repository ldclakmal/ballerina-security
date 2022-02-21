# Email

### Email Server

_docker-compose.yml_
```yaml
{{#include ../../../examples/email/resources/docker-compose.yml}}
```

```shell
$ docker-compose -f docker-compose.yml up
```

### IMAP Listener

_imap_email_listener_tls.bal_
```ballerina
{{#include ../../../examples/email/imap_email_listener_tls.bal}}
```

```shell
$ bal run imap_email_listener_tls.bal
```

### IMAP Client

_smtp_email_client_tls.bal_
```ballerina
{{#include ../../../examples/email/smtp_email_client_tls.bal}}
```

```shell
$ bal run smtp_email_client_tls.bal
```

---

#### Resources

_server.crt_
```
{{#include ../../../examples/email/resources/cert/server.crt}}
```
