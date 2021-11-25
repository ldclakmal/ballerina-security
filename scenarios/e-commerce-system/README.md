# E-Commerce System

#### Important Links
- [**Source Code**](https://github.com/ldclakmal/ballerina-security/tree/master/scenarios/e-commerce-system)
- [**Blog**](https://medium.com/@ldclakmal/microservices-security-with-ballerina-e9d430f05373)

### Overview

An e-commerce system that can be used to search for items and purchase items. 

The end-user (customer), in this example, **Alice** and **Bob**, interacts with the system using the web/mobile app 
provided. This web/mobile app acts as a **Client** on behalf of the user's actions.

We have two trust domains; the left side trust domain is allowed any HTTPS inbound traffic, and the right side trust 
domain is allowed the inbound traffic only from the left side trust domain. The system trusts the **Authorization 
Server/STS** and the **Certificate Authority (CA)** which are configured for this system.

In the left side trust domain, we have an **API Gateway**, which has both REST APIs and GraphQL APIs. The API Gateway 
routes the GraphQL API requests to **Inventory Service**, which is responsible for managing the inventory of the system, 
and the REST API requests to **Order Service**, which is responsible for processing the order for the customer.

In the right side trust domain, we have **Payment Service** and **Delivery Service** with gRPC APIs, which are called 
by the **Order Service** of the left side trust domain only to process the payment and delivery.

All the APIs are authenticated with different types and different levels of authentication mechanisms such as JWT auth, 
OAuth2, TLS, mTLS etc.

### Design

![figure-1](./e-commerce-system.png)

### Resources

- Customer Alice & Bob
- API Gateway
- Inventory Service
- Order Service
- Payment Service
- Delivery Service
- Authorization Server/STS [Reference: [WSO2 IS STS](https://hub.docker.com/r/ldclakmal/wso2is-sts)]
- Certificate Authority (CA)

### User Story

#### Scenario 1

Alice (customer) wants to search for electronic items.

First, she logs into the e-commerce app (Client) with her credentials, and once her credentials are validated 
successfully, she will be redirected to the dashboard of the app. There, Alice searches for electronic items and she 
gets a list of items with their details such as code, name, price, etc.

#### Scenario 2

Bob (customer) wants to place an order.

First, he logs into the e-commerce app (Client) with his credentials and once his credentials are validated 
successfully, he will be redirected to the dashboard of the app. There, Bob selects an electronic item and follows the 
purchasing process. Once completed, he gets a confirmation with the invoice, payment details, and delivery details, etc.

### Implementation

Detailed implementation details including security implementations details can be found on the blog 
[Microservices Security with Ballerina](https://medium.com/@ldclakmal/microservices-security-with-ballerina-e9d430f05373).

- [**Source Code**](https://github.com/ldclakmal/ballerina-security/tree/master/scenarios/e-commerce-system)

### Testing

Open the terminal and start the 'Authorization Server/STS' first by the following command.
```shell
$ docker run -p 9443:9443 ldclakmal/wso2is-sts:latest
```

Now, navigate to `scenarios/e-commerce-system/payment_service` directory and execute the following command.
```shell
$ bal run
```

The successful execution of the service should show us the following output.
```shell
Compiling source
        ldclakmal/payment_service:1.0.0

Running executable
```

Now, navigate to `scenarios/e-commerce-system/delivery_service` directory and execute the same command.
The successful execution of the service should show us the following output.
```shell
Compiling source
        ldclakmal/delivery_service:1.0.0

Running executable
```

Now, navigate to `scenarios/e-commerce-system/inventory_service` directory and execute the same command.
The successful execution of the service should show us the following output.
```shell
Compiling source
        ldclakmal/inventory_service:1.0.0

Running executable
```

Now, navigate to `scenarios/e-commerce-system/order_service` directory and execute the same command.
The successful execution of the service should show us the following output.
```shell
Compiling source
        ldclakmal/order_service:1.0.0

Running executable
```

Now, navigate to `scenarios/e-commerce-system/api_gateway` directory and execute the same command.
The successful execution of the service should show us the following output.
```shell
Compiling source
        ldclakmal/api_gateway:1.0.0

Running executable
```

Now, we can test authentication and authorization checks being enforced on different functions of the e-commerce system 
by sending HTTP requests. For example, we have used a sample client written by Ballerina and CURL commands to test each 
operation as follows.

#### Ballerina Client

Navigate to the `scenarios/e-commerce-system/client` directory and execute the following command to try out 
both of the scenarios described above.
```shell
$ bal run
```

Output:
```shell
Compiling source
        ldclakmal/client:1.0.0

Running executable

Search Response:
{"data":{"electronics":[{"brand":"Apple","model":"Mac Book AIR M1 (13-inch 2021)","price":"$1249.00"},{"brand":"Sony","model":"WH-1000XM4","price":"$349.99"}]}}

Order Response:
{"payment":"{"order_id":"HQCKJ5496", "invoice_id":"1c290d2b-f539-4f2a-832c-7c5c0466a76e", "payment_method":"VISA...1234", "amount":"$349.99"}","delivery":"{"order_id":"HQCKJ5496", "delivery_id":"3a58bc48-ffdd-4c1e-8d53-a3dbd6e962e0", "delivery_method":"DM01"}"}
```

#### CURL Commands

First, we need to get an access token from the Authorization Server/STS. We need to use that for authenticating the user 
requests when we are performing different scenarios. (Make sure to get a new access token each time you try this since 
the access token gets expired after an hour.)
```shell
curl -k -v -u uDMwA4hKR9H3deeXxvNf4sSU0i4a:8FOUOKUQfOp47pUfJCsPA5X4clga \
-H "Content-Type:application/x-www-form-urlencoded" \
-d "grant_type=client_credentials&scope=customer" \
https://localhost:9443/oauth2/token
```

Output:
```shell
{"access_token":"e4a42228-f985-3725-b033-5b9ff11e03fd","token_type":"Bearer","expires_in":3600}
```

##### Search Item

```shell
curl -k -v -H "Content-type: application/json" \
-H "Authorization: Bearer e4a42228-f985-3725-b033-5b9ff11e03fd" \
-d '{ "query": "{ electronics { brand, model, price } }" }' \
"https://localhost:9090/inventory"
```

Output:
```shell
{"data":{"electronics":[{"brand":"Apple", "model":"Mac Book AIR M1 (13-inch 2021)", "price":"$1249.00"}, 
{"brand":"Sony", "model":"WH-1000XM4", "price":"$349.99"}]}}
```

##### Order Item

```shell
curl -k -v -H "Content-type: application/json" \
-H "Authorization: Bearer e4a42228-f985-3725-b033-5b9ff11e03fd" \
-d '{ "orderId": "HQCKJ5496", "category": "electronics", "code": "SOWH1000XM4", "qty": 2, "paymentMethod": "VISA...1234", "deliveryMethod": "DM01" }' \
"https://localhost:9090/orders"
```

Output:
```shell
{"payment":"{\"order_id\":\"HQCKJ5496\", \"invoice_id\":\"a658ac39-a5d1-45c3-b76d-97db86815243\", 
\"payment_method\":\"VISA...1234\", \"amount\":\"$349.99\"}", "delivery":"{\"order_id\":\"HQCKJ5496\", 
\"delivery_id\":\"d77336a7-2a8c-4732-96f3-ef84ae5c4b3d\", \"delivery_method\":\"DM01\"}"}
```