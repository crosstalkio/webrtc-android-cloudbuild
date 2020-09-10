# WebRTC Android on Google Cloud Build

This project builds WebRTC Android and publishes maven package to [bintray](https://bintray.com) with [Cloud Build](https://cloud.google.com/cloud-build). Please note that you will have to pay in order to use Cloud Build. The rough build time of different machine types are:

- n1-standard-1: 2h40m
- n1-highcpu-8: 40m
- n1-highcpu-32: 20m

## Build on Cloud

To build it on Cloud Build, please check [prerequisites](https://cloud.google.com/cloud-build/docs/quickstart-build) first, and then execute this command in a terminal:

```shell
gcloud builds submit \
    --substitutions _BINTRAY_USER=<your_bintray_user>,_BINTRAY_API_KEY=<your_bintray_api_key>
```

## Build Locally

To build it locally, please check [prerequisites](https://cloud.google.com/cloud-build/docs/build-debug-locally) first, and then execute this command in a terminal:

```shell
cloud-build-local \
    --config=cloudbuild.yaml \
    --substitutions _BINTRAY_USER=<your_bintray_user>,_BINTRAY_API_KEY=<your_bintray_api_key> \
    --dryrun=false \
    .
```

Please be noted that this will download about 20GB of data and may take hours to build.

## Builder Docker Image

The docker image of building environment used by this project was built by the [sister project](https://github.com/crosstalkio/webrtc-android-builder).
