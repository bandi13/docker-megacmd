FROM ubuntu:22.04 as build

RUN DEBIAN_FRONTEND=noninteractive apt update && \
    apt install -y autoconf libtool g++ libcrypto++-dev libz-dev libsqlite3-dev libssl-dev libcurl4-gnutls-dev \
        libreadline-dev libpcre++-dev libsodium-dev libc-ares-dev libfreeimage-dev libavcodec-dev libavutil-dev \
        libavformat-dev libswscale-dev libmediainfo-dev libzen-dev libuv1-dev git libicu-dev make

RUN git clone https://github.com/meganz/MEGAcmd.git && \
    cd MEGAcmd && git submodule update --init --recursive && \
    sh autogen.sh && \
    ./configure --disable-dependency-tracking && \
    make && \
    make install

FROM ubuntu:22.04 as final

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    DEBIAN_FRONTEND=noninteractive apt update && \
    apt install -y libpcrecpp0v5 libc-ares2 libcurl3-gnutls libavcodec58 libavformat58 libswscale5 libuv1 libmediainfo0v5 libcrypto++8 libsqlite3-0 libfreeimage3

ENV LD_LIBRARY_PATH=/usr/local/lib
copy --from=build /usr/local /usr/local
