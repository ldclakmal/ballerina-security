# Kafka

### Kafka Server

_docker-compose.yml_
```yaml
{{#include ../../../examples/kafka/resources/docker-compose.yml}}
```

_kafka_jaas.conf_
```yaml
{{#include ../../../examples/kafka/resources/kafka_jaas.conf}}
```

_zookeeper_jaas.conf_
```yaml
{{#include ../../../examples/kafka/resources/zookeeper_jaas.conf}}
```

```shell
$ docker-compose -f docker-compose.yml up
```

### Consumer

_kafka_consumer_sasl_plain_auth.bal_
```ballerina
{{#include ../../../examples/kafka/kafka_consumer_sasl_plain_auth.bal}}
```

```shell
$ bal run kafka_consumer_sasl_plain_auth.bal
```

### Producer

_kafka_producer_sasl_plain_auth.bal_
```ballerina
{{#include ../../../examples/kafka/kafka_producer_sasl_plain_auth.bal}}
```

```shell
$ bal run kafka_producer_sasl_plain_auth.bal
```

---

#### Resources

_ca.crt_
```
{{#include ../../../examples/kafka/resources/cert/ca.crt}}
```

_client.crt_
```
{{#include ../../../examples/kafka/resources/cert/client.crt}}
```

_server.crt_
```
{{#include ../../../examples/kafka/resources/cert/server.crt}}
```

_client.key_
```
{{#include ../../../examples/kafka/resources/key/client.key}}
```

_server.key_
```
{{#include ../../../examples/kafka/resources/key/server.key}}
```
