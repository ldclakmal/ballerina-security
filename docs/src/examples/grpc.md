# gRPC

### Service

_grpc.proto_
```proto
{{#include ../../../examples/grpc/resources/grpc.proto}}
```

```shell
$ bal grpc --input grpc.proto --output .
```

_grpc_service_jwt_auth.bal_
```ballerina
{{#include ../../../examples/grpc/service/grpc_service_jwt_auth.bal}}
```

```shell
$ bal build
```

### Client

_grpc.proto_
```proto
{{#include ../../../examples/grpc/resources/grpc.proto}}
```

```shell
$ bal grpc --input grpc.proto --output .
```

_grpc_client_self_signed_jwt_auth.bal_
```ballerina
{{#include ../../../examples/grpc/client/grpc_client_self_signed_jwt_auth.bal}}
```

```shell
$ bal build
```

---

#### Resources

_public.crt_
```
{{#include ../../../examples/grpc/resources/public.crt}}
```

_private.key_
```
{{#include ../../../examples/grpc/resources/private.key}}
```
