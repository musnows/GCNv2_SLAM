#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

# wget -O Pangolin-0.6.tar.gz https://github.com/stevenlovegrove/Pangolin/archive/refs/tags/v0.6.tar.gz
tar -zxvf Pangolin-0.6.tar.gz

pushd Pangolin-0.6
    rm -rf build
    mkdir build && cd build
    # 编译安装 
    cmake -DCPP11_NO_BOOST=1 ..
    make -j$(nproc)
    make install
    # 刷新动态库
    ldconfig
    # 检查安装成功(能不能编译demo)
    cd ../examples/HelloPangolin
    mkdir build && cd build
    cmake ..
    make
popd

rm -rf Pangolin-0.6 Pangolin-0.6.tar.gz
