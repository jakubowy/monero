FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt update \
 && apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

WORKDIR /
RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir -p /xmrig/build

RUN sed -i 's/kDefaultDonateLevel = 1/kDefaultDonateLevel = 0/g' /xmrig/src/donate.h
RUN sed -i 's/kMinimumDonateLevel = 1/kMinimumDonateLevel = 0/g' /xmrig/src/donate.h
WORKDIR /xmrig/build

RUN cmake .. \
 && make -j$(nproc)


