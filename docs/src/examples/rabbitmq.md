# RabbitMQ

### RabbitMQ Server

_docker-compose.yml_
```yaml
{{#include ../../../examples/rabbitmq/resources/docker-compose.yml}}
```

_rabbitmq.conf_
```yaml
{{#include ../../../examples/rabbitmq/resources/rabbitmq.conf}}
```

```shell
$ docker-compose -f docker-compose.yml up
```

### Consumer

_rabbitmq_consumer_credentials_auth.bal_
```ballerina
{{#include ../../../examples/rabbitmq/rabbitmq_consumer_credentials_auth.bal}}
```

```shell
$ bal run rabbitmq_consumer_credentials_auth.bal
```

### Producer

_rabbitmq_producer_credentials_auth.bal_
```ballerina
{{#include ../../../examples/rabbitmq/rabbitmq_producer_credentials_auth.bal}}
```

```shell
$ bal run rabbitmq_producer_credentials_auth.bal
```

---

#### Resources

_ca.crt_
```
{{#include ../../../examples/rabbitmq/resources/cert/ca.crt}}
```

_client.crt_
```
{{#include ../../../examples/rabbitmq/resources/cert/client.crt}}
```

_server.crt_
```
{{#include ../../../examples/rabbitmq/resources/cert/server.crt}}
```

_client.key_
```
{{#include ../../../examples/rabbitmq/resources/key/client.key}}
```

_server.key_
```
{{#include ../../../examples/rabbitmq/resources/key/server.key}}
```
