FROM huaqinkaka/ubuntu_18.04_build:latest

LABEL maintainer="Kaka Ni nigang@huaqin.com" version="1.0" \
	Description="Add gcc-arm-none-eabi-9-2020-q2-update-x86_64 and Cmake" 

USER root

ADD https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 \
	/tmp/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2

ADD https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2-Linux-x86_64.tar.gz \
	/tmp/cmake-3.18.2-Linux-x86_64.tar.gz

RUN tar xvf /tmp/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 -C /usr/local && \
	rm -rf /tmp/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 && \
	tar xvf /tmp/cmake-3.18.2-Linux-x86_64.tar.gz -C /usr/local && \
	rm -rf /tmp/cmake-3.18.2-Linux-x86_64.tar.gz


ENV PATH="$PATH:/usr/local/gcc-arm-none-eabi-9-2020-q2-update/bin:/usr/local/cmake-3.18.2-Linux-x86_64/bin"
ENV ARMGCC_DIR="/usr/local/gcc-arm-none-eabi-9-2020-q2-update"


WORKDIR /media/code
