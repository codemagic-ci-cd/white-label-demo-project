# White label sample project for Flutter

This sample shows how to set up multiple workflows and branches to white label a core version of a Flutter app. 

Please refer to the `codemagic.yaml` in the project root of any branches that will be built. This configuration makes use of a definitions sections where scripts and settings can be defined and then reused in the workflows which reduces code repition.

## Overview of white labeling with Codemagic

To get an overview of how you can white label your mobile apps with Codemagic, please refer to the overview provided in the documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-apps-overview/).

## White label automation scripts

The majority white label automation is done using shell scripts to perform tasks such as downloading assets, copying files such as logos, images, fonts etc. to a new location, or changing string values in projects. Please refer to the white labeling scripts samples in the Codemagic documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-scripts/).

## How to use this sample project?
In order to use this sample project you have to consider the following:

- Create a zip archive for each customer that contains their unique assets and use a unique identifier in the file name for each customer, e.g. `assets_001.zip` for client `001`.
- Save all the customers’ archive files in your AWS S3 bucket. 
change the value of the [`S3_BUCKET_NAME`](https://github.com/codemagic-ci-cd/white-label-demo-project/blob/5b7646cb39859adf939da21a826b55c68b28d14a/codemagic.yaml#L10) variable to match your bucket name.
- Each customer zip archive should have the following files with this naming convention:
    - **`ios_assets/`**. This folder contains the iOS icons from `/ios/Runner/Assets.xcassets/AppIcon.appiconset/`.
    - **`android_assets/`**. This folder contains the Android icons from `/android/app/src/main/res/`.
    - **`android.keystore`**. The signing keystore for the Android app.
    - **`.env`** file if you app uses some secrets at runtime.
    - **`settings.env`**. This file has all of the customer data that Codemagic will use during the build to set or replace the base code, and the required info to sign and publish the final app to the stores.
- The **`settings.env`** file should look something like this:

```jsx
PACKAGE_NAME=io.codemagic.whitelabel001

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

- Create a new environment variable group named `**aws_credentials**` with `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION` variables.
- If you want to publish to **Play Store** then you need to create a new environment variable group named `**playstore_credentials**` with `GCLOUD_SERVICE_ACCOUNT_CREDENTIALS` This service account will be used only for validating the workflow, not to publish the final app, because it’ll we replaced in the scripts.
- Trigger builds with the Codemagic REST API, and pass the client Id, like this:

```jsx
curl -H "Content-Type: application/json" -H "x-auth-token: ${CM_API_KEY}" \
      --data '{
          "appId": "your-codemagic-app-id", 
          "workflowId": "your-codemagic-workflow-id",
          "branch": "main",
          "labels": ["'${CLIENT}'"],
          "environment": { 
              "variables": { 
                  "CLIENT_ID": "'${CLIENT}'"
              }
          }
        }' \
       https://api.codemagic.io/builds
```

## Branching and workflow strategies

There are many approaches to white labeling and setting up workflows. If you haven't already decided on your own strategy, you can use our suggested approach which can be found in the documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-branching-strategies/).

