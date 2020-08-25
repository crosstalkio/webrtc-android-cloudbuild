# WebRTC Android on Google Cloud Build

This project builds WebRTC Android within only 20 mins by leveraging the 32 CPUs VM provided by [Cloud Build](https://cloud.google.com/cloud-build). And thanks God that Google offers 2 hours of free build time per day.

## Build on Cloud

To build it on Cloud Build, please check [prerequisites](https://cloud.google.com/cloud-build/docs/quickstart-build) first, and then execute this command in a terminal:

```shell
gcloud builds submit \
    --substitutions _BINTRAY_USER=<your_bintry_user>,_BINTRAY_API_KEY=<your_bintry_api_key>
```

## Build Locally

To build it locally, please check [prerequisites](https://cloud.google.com/cloud-build/docs/build-debug-locally) first, and then execute this command in a terminal:

```shell
cloud-build-local \
    --config=cloudbuild.yaml \
    --substitutions _BINTRAY_USER=<your_bintry_user>,_BINTRAY_API_KEY=<your_bintry_api_key> \
    --dryrun=false \
    .
```

Please be noted that this will download dozens gigabytes of data and may take hours to finish.

## Builder Docker Image

The docker image of building environment used by this project was built by the [sister project](https://github.com/crosstalkio/webrtc-android-builder).
