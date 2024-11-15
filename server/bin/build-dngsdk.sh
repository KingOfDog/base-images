#!/usr/bin/env bash

set -e

git clone https://github.com/hfiguiere/dng_sdk.git
cd dng_sdk

ls -l /usr/local/lib

mkdir _build
meson --libdir /usr/lib _build
ninja -C _build

mkdir /usr/local/include/dng
cp ./dng_sdk/source/*.h /usr/local/include/dng
cp ./dng_sdk/projects/meson/*.h /usr/local/include/dng

cd _build
cp ./dng_sdk/source/libdng_sdk.a /usr/local/lib
cp ./xmp/toolkit/libxmp_sdk.a /usr/local/lib

cd ../.. && rm -rf dng_sdk
ldconfig /usr/local/lib
