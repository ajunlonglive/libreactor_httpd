FROM alpine:edge
RUN apk add --update alpine-sdk automake autoconf libtool

RUN git clone https://github.com/fredrikwidlund/libdynamic && \
    cd libdynamic && \
    ./autogen.sh && \
    ./configure && \
    make install

RUN git clone https://github.com/fredrikwidlund/libreactor && \
    cd libreactor && \
    git checkout release-2.0 && \
    ./autogen.sh && \
    ./configure && \
    make install
