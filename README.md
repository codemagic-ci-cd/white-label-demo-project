# White label sample project for Flutter

This sample shows how to white-label your core version of a Flutter app without the need to create multiple workflows.

## Overview of white labeling with Codemagic

When you white-label your app with Codemagic, you don't have to create a separate workflow for each client, one abstract workflow to build them all, and using RESTful API requests you can specify the client you want to white-label your app for.

To get an overview of how you can white-label your mobile apps with Codemagic, please refer to the overview provided in the documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-apps-overview/).

The majority of white label automation is done using shell scripts to perform tasks such as downloading assets, copying files such as logos, images, fonts, etc. to a new location, or changing string values in projects. Please refer to the white labeling scripts samples in the Codemagic documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-scripts/).

Let's assume that you have the following:

- A zip archive for each customer that contains their unique assets and uses a unique identifier in the file name for each customer, e.g. `assets_001.zip` for client `001`.
- All the customers’ archive files are saved in a secure environemt e.g.(S3/GCP bucket, or headless CMS). 
- Each customer zip archive has the following files with this naming convention:
    - **`ios_assets/`**. This folder contains the iOS icons from `/ios/Runner/Assets.xcassets/AppIcon.appiconset/`.
    - **`android_assets/`**. This folder contains the Android icons from `/android/app/src/main/res/`.
    - **`android.keystore`**. The signing keystore for the Android app.
    - **`.env`** file if your app uses some secrets at runtime.
    - **`settings.env`**. This file can have the customer data that Codemagic will use during the build to set or replace the base code, and the required info to sign and publish the final app to the stores.
- The **`settings.env`** file can look something like this:

```jsx
PACKAGE_NAME=io.codemagic.whitelabel001

PRIMARY_COLOR=0xFFB74093
SECONDARY_COLOR=0xFFB74057

CM_KEYSTORE_PASSWORD=keystore-password
CM_KEY_PASSWORD=key-password
CM_KEY_ALIAS=key-alias
CM_KEYSTORE_PATH=../../client_assets/key.keystore

GCLOUD_SERVICE_ACCOUNT_CREDENTIALS='{
  "type": "service_account",
  "project_id": "xxxx",
  "private_key_id": "xxxx",
  "private_key": "-----BEGIN PRIVATE KEY-----\nXXXX\n-----END PRIVATE KEY-----\n",
  "client_email": "xxxxx-xxxx@pxxxx.iam.gserviceaccount.com",
  "client_id": "xxxx",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/xxxx-xxxx%40pc-api-xxxx-xxxx.iam.gserviceaccount.com"
}'

APP_STORE_ID=xxxxxxxxxx

BUNDLE_ID=io.codemagic.whitelabel.001

APP_STORE_CONNECT_KEY_IDENTIFIER=XXXXXXXXXX
APP_STORE_CONNECT_ISSUER_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

APP_STORE_CONNECT_PRIVATE_KEY='-----BEGIN PRIVATE KEY-----
xxxx
xxxx
xxxx
xxxx
-----END PRIVATE KEY-----'

CERTIFICATE_PRIVATE_KEY='-----BEGIN RSA PRIVATE KEY-----
xxxx
xxxx
xxxx
xxxx
-----END RSA PRIVATE KEY-----'
```

- If you want to publish to **Play Store** then you need to create a new environment variable group named **`playstore_credentials`** with `GCLOUD_SERVICE_ACCOUNT_CREDENTIALS` This service account will be used only for validating the workflow, not to publish the final app, because it’ll be replaced in the scripts.
- Trigger builds with the Codemagic REST API, and pass the client Id, like this:

## Triggering builds
The Codemagic REST API is used in a white-label workflow to trigger builds for each unique client version you need to build. When triggering a build, you can pass environment variables that identify a specific client so their unique assets can be downloaded and used for the build. It can be as simple as passing the ID number associated with the client. 

### Request endpoint
The request URL for dealing with the builds is: `https://api.codemagic.io/builds`
### Request headers
To authorize your request you need to pass the `API access token`, which is available in the Codemagic UI under **Teams > Personal Account > Integrations > Codemagic API > Show**. 
```jsx
{
    "x-auth-token: <your-auth-token>"
}
```
### Request body
In the request body you need to pass the following:
1. `appId`. Once you have added your app in Codemagic, open its settings and copy the **application id** from the browser address bar - `https://codemagic.io/app/<APP_ID>/settings`
2. `workflowId`. The name of the workflow in your `codemagic.yaml` file.
3. `branch`. The name of the branch you want Codemagic to build from.
4. `environment`. This object holds the `variables` object which has the `variables` you need to pass to the workflow. In our example, it's required to pass the `client Id` so our workflow can identify the client we're building for.
```jsx
{
"appId": "<your-codemagic-app-id>", 
"workflowId": "<your-codemagic-workflow-id>",
"branch": "<branch-name>",
"environment": { 
    "variables": { 
        "CLIENT_ID": "<your-client-id>"
    }
}
}
```

### Using cURL
This is the cURL command to trigger a new build:
```jsx
curl -H "Content-Type: application/json" -H "x-auth-token: <your-auth-token>" \
      --data '{
          "appId": "<your-codemagic-app-id>", 
          "workflowId": "<your-codemagic-workflow-id>",
          "branch": "<branch-name>",
          "environment": { 
              "variables": { 
                  "CLIENT_ID": "<your-client-id>"
              }
          }
        }' \
       https://api.codemagic.io/builds
```

## Branching and workflow strategies

There are many approaches to white labeling and setting up workflows. If you haven't already decided on your strategy, you can use our suggested approach which can be found in the documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-branching-strategies/).

## Definitions and anchors
Check out [this](https://github.com/codemagic-ci-cd/white-label-demo-project/tree/anchors) branch to see how you can use anchors in your `codemagic.yaml` file if you have multiple workflows and you want to avoid repetitions.