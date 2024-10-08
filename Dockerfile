FROM ubuntu:22.04

ENV TZ=America/New_York

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        gawk \ 
        wget \
        git \
        diffstat \ 
        unzip \
        texinfo \
        gcc \
        g++ \
        build-essential \ 
        chrpath \
        socat \
        cpio \
        python3 \
        python3-pip \
        python3-pexpect \
        xz-utils \
        debianutils \
        iputils-ping \
        python3-git \
        python3-jinja2 \
        python3-subunit \
        zstd \
        liblz4-tool \ 
        file \
        locales \
        libacl1 \
        tzdata \
        curl \
        vim \
        openssh-client

RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime \
&& dpkg-reconfigure --frontend noninteractive tzdata


RUN locale-gen en_US.UTF-8

RUN groupadd -g 1001 aj && useradd -m -u 1001 -g 1001 aj

USER aj

WORKDIR /home/aj

RUN mkdir yocto

WORKDIR /home/aj/yocto

RUN mkdir sources

WORKDIR /home/aj/yocto/sources

RUN git clone -b kirkstone git://git.yoctoproject.org/poky
RUN git clone -b kirkstone git://git.yoctoproject.org/meta-raspberrypi
RUN git clone -b kirkstone https://github.com/openembedded/meta-openembedded.git

RUN cd ..

# # Set up the environment and run bitbake
# COPY build.sh /home/aj/yocto/build.sh
# RUN chmod +x /home/aj/yocto/build.sh

# Set the default command to run when the container starts





