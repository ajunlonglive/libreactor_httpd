FROM ubuntu:focal

RUN apt-get -y update && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get -y install build-essential automake autoconf libtool git gcc-10 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 90 --slave /usr/bin/gcov gcov /usr/bin/gcov-10

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
