# NATS

### NATS Server

_docker-compose.yml_
```yaml
{{#include ../../../examples/nats/resources/docker-compose.yml}}
```

_server.conf_
```yaml
{{#include ../../../examples/nats/resources/server.conf}}
```

```shell
$ docker-compose -f docker-compose.yml up
```

### Subscriber

_nats_subscriber_credentials_auth.bal_
```ballerina
{{#include ../../../examples/nats/nats_subscriber_credentials_auth.bal}}
```

```shell
$ bal run nats_subscriber_credentials_auth.bal
```

### Publisher

_nats_publisher_credentials_auth.bal_
```ballerina
{{#include ../../../examples/nats/nats_publisher_credentials_auth.bal}}
```

```shell
$ bal run nats_publisher_credentials_auth.bal
```

---

#### Resources

_ca.crt_
```
{{#include ../../../examples/nats/resources/cert/ca.crt}}
```

_client.crt_
```
{{#include ../../../examples/nats/resources/cert/client.crt}}
```

_server.crt_
```
{{#include ../../../examples/nats/resources/cert/server.crt}}
```

_client.key_
```
{{#include ../../../examples/nats/resources/key/client.key}}
```

_server.key_
```
{{#include ../../../examples/nats/resources/key/server.key}}
```
