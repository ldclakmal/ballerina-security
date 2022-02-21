# GraphQL

### Service

_graphql_service_jwt_auth.bal_
```ballerina
{{#include ../../../examples/graphql/graphql_service_jwt_auth.bal}}
```

```shell
$ bal run graphql_service_jwt_auth.bal
```

### Client

_http_client_self_signed_jwt_auth.bal_
```ballerina
{{#include ../../../examples/graphql/http_client_self_signed_jwt_auth.bal}}
```

```shell
$ bal run http_client_self_signed_jwt_auth.bal
```

---

#### Resources

_public.crt_
```
{{#include ../../../examples/graphql/resources/public.crt}}
```

_private.key_
```
{{#include ../../../examples/graphql/resources/private.key}}
```
