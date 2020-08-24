IMAGE_NAME := crosstalkio/webrtc-android-cloudbuild

all: image

image:
	docker build --network=host --force-rm \
	-t $(IMAGE_NAME) \
	-f Dockerfile \
	.

push:
	docker push $(IMAGE_NAME)

.PHONY: all image push
