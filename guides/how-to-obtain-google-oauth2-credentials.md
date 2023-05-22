# How to obtain Google OAuth2.0 Credentials

1. Visit [Google API Console](https://console.developers.google.com).
2. Click **Create Project**, and follow the wizard to create a new project.
3. Go to **Dashboard**, click on **ENABLE APIS AND SERVICES** and select the Google API you want, and click **ENABLE**.
4. Go to the **Credentials → OAuth consent screen**, enter a product name to be shown to users, and click **Save**.
5. On the **Credentials** tab, click **Create credentials** and select **OAuth _Client ID_**.
6. Select an application type, enter a name for the application, and specify a redirect URI.
   > **Note** Enter https://developers.google.com/oauthplayground if you want to use [OAuth 2.0 playground](https://developers.google.com/oauthplayground) to receive the _Authorization Code_, _Access Token_, and _Refresh Token_.
 vi. Click **Create**. Your _Client ID_ and _Client Secret_ will appear as a popup.

7. Visit [OAuth 2.0 playground](https://developers.google.com/oauthplayground), in a separate browser window or tab.
8. Click the ⚙️ (settings icon) in the top right corner, and you can obtain the _Token endpoint_.
9. Tick **Use your OAuth credentials** in pop-down of ⚙️ and paste the obtained _Client ID_ and _Client Secret_ there.
10. On the left side of the window, under **Step 1 - Select & authorize APIs**, select the required Google API scopes, and then click **Authorize APIs**.
11. When you receive your _Authorization Code_, click **Exchange _Authorization Code_ for tokens** to obtain the _Refresh Token_ and _Access token_.

---

### Now you have obtained the followings:
- Authorization Code
- Refresh Token
- Access token
- Token endpoint
- Client ID
- Client Secret
