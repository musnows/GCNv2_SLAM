#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

# wget -O eigen-3.3.7.tar.gz https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz
tar -zxvf eigen-3.3.7.tar.gz

pushd eigen-3.3.7
    rm -rf build
    mkdir build && cd build
    cmake ..
    make -j$(nproc)
    make install
    # 拷贝头文件
    cp -r /usr/local/include/eigen3/Eigen /usr/local/include
    # 刷新动态库
    ldconfig
popd

# 编译检测
TEST_FILE=test_eigen
g++ test_eigen.cpp -o $TEST_FILE
./$TEST_FILE

rm -rf eigen-3.3.7.tar.gz eigen-3.3.7 $TEST_FILE
