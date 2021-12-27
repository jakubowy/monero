FROM ubuntu:20.04

RUN apt update \
 && apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

WORKDIR /
RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir -p /xmrig/build

WORKDIR /xmrig/build

RUN cmake .. \
 && make -j$(nproc)


