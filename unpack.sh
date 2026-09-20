#!/bin/bash
set -e

THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

SDK_VERSION="1.4.357.0"
SDK_ARCHIVE="vulkansdk-linux-x86_64-$SDK_VERSION.tar.xz"

mkdir -p $THIS_DIR/dist && cd $THIS_DIR/dist
wget -N "https://sdk.lunarg.com/sdk/download/${SDK_VERSION}/linux/${SDK_ARCHIVE}"
tar -xf $SDK_ARCHIVE -C $THIS_DIR/sdk/ --strip-components=1 --skip-old-files

mkdir -p $THIS_DIR/sdk && cd $THIS_DIR/sdk
./vulkansdk \
    --maxjobs \
    glslang \
    vulkan-headers \
    vulkan-loader \
    vulkan-validationlayers \
    vulkantools \
    shaderc \
    spirv-headers \
    spirv-tools \
    spirv-cross \
    gfxreconstruct \
    spirv-reflect \
    vulkan-extensionlayer \
    vulkan-profiles \
    DirectXShaderCompiler \
    volk \
    VulkanMemoryAllocator \
    VulkanCapsViewer \
    Vulkan-Utilities-Library \
    slang
