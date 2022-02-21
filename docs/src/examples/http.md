# HTTP

### Service

_http_service_jwt_auth.bal_
```ballerina
{{#include ../../../examples/http/http_service_jwt_auth.bal}}
```

```shell
$ bal run http_service_jwt_auth.bal
```

### Client

_http_client_self_signed_jwt_auth.bal_
```ballerina
{{#include ../../../examples/http/http_client_self_signed_jwt_auth.bal}}
```

```shell
$ bal run http_client_self_signed_jwt_auth.bal
```

---

#### Resources

_public.crt_
```
{{#include ../../../examples/http/resources/public.crt}}
```

_private.key_
```
{{#include ../../../examples/http/resources/private.key}}
```
