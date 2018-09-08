#!/bin/sh

INSTALL_NAME="/imx6ul_install"
INSTALL_PATH_NAME=$PWD$INSTALL_NAME
CROSS_COMPILE_ENV="/home/work/imx6ul/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin"
CROSS_COMPILE_PREFIX="/home/work/imx6ul/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-"

echo "install lib path:"
echo $INSTALL_PATH_NAME 

cd openssl-1.0.1f/
make clean


#set compile env
export PATH=$PATH:$CROSS_COMPILE_ENV
export CC=arm-linux-gnueabihf-gcc

#config 
./config no-asm shared --prefix=$INSTALL_PATH_NAME --openssldir=$INSTALL_PATH_NAME"/ssl"

#去掉Makefile中的-m64 , arm平台是32位
sed -i "s/-m64//g" Makefile

#编译
make

#安装
make install 
