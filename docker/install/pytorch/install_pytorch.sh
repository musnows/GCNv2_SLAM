#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"
# 编译运行需要
pip3 install pyyaml 

git clone --recursive -b v1.0.1 https://github.com/pytorch/pytorch
pushd pytorch
    # 修改不兼容的pyyaml代码
    sed -i "s|yaml.load('\n'.join(declaration_lines))|yaml.load('\n'.join(declaration_lines),Loader=yaml.FullLoader)|" ./aten/src/ATen/cwrap_parser.py
    sed -i "s|yaml.load('\n'.join(declaration_lines))|yaml.load('\n'.join(declaration_lines),Loader=yaml.FullLoader)|" ./tools/cwrap/cwrap.py
    # 开始编译libtorch
    rm -rf build
    mkdir build && cd build
    python3 ../tools/build_libtorch.py
ldconfig
popd
