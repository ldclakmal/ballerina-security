# STAN

### STAN Server

_docker-compose.yml_
```yaml
{{#include ../../../examples/stan/resources/docker-compose.yml}}
```

_server.conf_
```yaml
{{#include ../../../examples/stan/resources/server.conf}}
```

```shell
$ docker-compose -f docker-compose.yml up
```

### Subscriber

_stan_subscriber_credentials_auth.bal_
```ballerina
{{#include ../../../examples/stan/stan_subscriber_credentials_auth.bal}}
```

```shell
$ bal run stan_subscriber_credentials_auth.bal
```

### Publisher

_stan_publisher_credentials_auth.bal_
```ballerina
{{#include ../../../examples/stan/stan_publisher_credentials_auth.bal}}
```

```shell
$ bal run stan_publisher_credentials_auth.bal
```

---

#### Resources

_ca.crt_
```
{{#include ../../../examples/stan/resources/cert/ca.crt}}
```

_client.crt_
```
{{#include ../../../examples/stan/resources/cert/client.crt}}
```

_server.crt_
```
{{#include ../../../examples/stan/resources/cert/server.crt}}
```

_client.key_
```
{{#include ../../../examples/stan/resources/key/client.key}}
```

_server.key_
```
{{#include ../../../examples/stan/resources/key/server.key}}
```
