# How to obtain Salesforce Developer OAuth2 Credentials

## Create an SF account
[https://developer.salesforce.com/signup](https://developer.salesforce.com/signup)

## How to get the access token

### Prerequisites:
- Consumer Key
- Consumer Secret
- Callback URL

### Steps
1. Replace the `<CONSUMER_KEY>` and `<CALLBACK_URL>` of the following URL. Then copy and paste the URL into the browser.
    ```shell
    https://ap5.salesforce.com/services/oauth2/authorize?response_type=code&client_id=<CONSUMER_KEY>&redirect_uri=<CALLBACK_URL>
    ```

    - The browser will redirect to your `<CALLBACK_URL>` with the additional URL parameter called "code". It will look like, `<CALLBACK_URL>?code=<CODE>`
  
2. Build the following URL with the obtained `<CODE>`.

    ```shell
    https://ap5.salesforce.com/services/oauth2/token?code=<CODE>&grant_type=authorization_code&client_id=<CONSUMER_KEY>&client_secret=<CONSUMER_SECRET>&redirect_uri=<REDIRECT_URI>
    ```

3. Send a POST request to the build URL. You can send the POST request with CURL.

    ```shell
    curl -X POST 'https://ap5.salesforce.com/services/oauth2/token?code=<CODE>&grant_type=authorization_code&client_id=<CONSUMER_KEY>&client_secret=<CONSUMER_SECRET>&redirect_uri=<REDIRECT_URI>'
    ```

    - You will receive a JSON response with `<ACCESS_TOKEN>` and `<REFRESH_TOKEN`. It will look like follows:

        ```json
        {
            "access_token": "<ACCESS_TOKEN>",
            "refresh_token": "<REFRESH_TOKEN>",
            "signature": "<SIGNATURE>",
            "scope": "<SCOPE>",
            "instance_url": "https://ap5.salesforce.com",
            "id": "<ID>",
            "token_type": "Bearer",
            "issued_at": "<TIMESTAMP>"
        }
        ```
