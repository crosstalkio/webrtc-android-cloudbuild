FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --no-install-recommends -qy \
    ca-certificates curl git lsb-release sudo python python-pip file tzdata
RUN pip install requests setuptools

RUN mkdir -p /webrtc/linux
WORKDIR /webrtc

RUN curl "https://chromium.googlesource.com/chromium/src/+/master/build/install-build-deps.sh?format=TEXT" | base64 --decode > /webrtc/install-build-deps.sh
RUN curl "https://chromium.googlesource.com/chromium/src/+/master/build/linux/install-chromeos-fonts.py?format=TEXT" | base64 --decode > /webrtc/linux/install-chromeos-fonts.py
RUN curl "https://chromium.googlesource.com/chromium/src/+/master/build/install-build-deps-android.sh?format=TEXT" | base64 --decode > /webrtc/install-build-deps-android.sh
RUN chmod +x /webrtc/*.sh
RUN /webrtc/install-build-deps-android.sh

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH $PATH:/webrtc/depot_tools

COPY patches /webrtc/patches
