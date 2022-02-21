# WebSocket

### Service

_websocket_service_jwt_auth.bal_
```ballerina
{{#include ../../../examples/websocket/websocket_service_jwt_auth.bal}}
```

```shell
$ bal run websocket_service_jwt_auth.bal
```

### Client

_websocket_client_self_signed_jwt_auth.bal_
```ballerina
{{#include ../../../examples/websocket/websocket_client_self_signed_jwt_auth.bal}}
```

```shell
$ bal run websocket_client_self_signed_jwt_auth.bal
```

---

#### Resources

_public.crt_
```
{{#include ../../../examples/websocket/resources/public.crt}}
```

_private.key_
```
{{#include ../../../examples/websocket/resources/private.key}}
```
