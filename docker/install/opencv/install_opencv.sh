#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"
apt-get install -y libcanberra-gtk-module

# 下载和解压
wget -O opencv-3.4.5.tar.gz https://github.com/opencv/opencv/archive/refs/tags/3.4.5.tar.gz
tar -zxvf opencv-3.4.5.tar.gz
# 开始编译和安装
pushd opencv-3.4.5
    rm -rf build
    mkdir build && cd build 
    # 构建和编译安装，-j4代表4线程并发
    cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
    make -j$(nproc)
    make install
    # 刷新动态库
    ldconfig
    # 检测是否安装成功
    cd ../samples/cpp/example_cmake
    mkdir build && cd build 
    cmake ..
    make
popd

rm -rf opencv-3.4.5 opencv-3.4.5.tar.gz
