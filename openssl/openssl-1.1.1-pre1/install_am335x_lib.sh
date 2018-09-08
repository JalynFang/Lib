#!/bin/sh

INSTALL_NAME="/am335x_install"
INSTALL_PATH_NAME=$PWD$INSTALL_NAME
CROSS_COMPILE_PREFIX="/usr/local/arm/crosschain/am335x/bin/arm-arago-linux-gnueabi-"

echo "install lib path:"
echo $INSTALL_PATH_NAME 

make clean

#config 
./config no-asm --prefix=$INSTALL_PATH_NAME --openssldir=$INSTALL_PATH_NAME"/ssl" --cross-compile-prefix=$CROSS_COMPILE_PREFIX

#去掉Makefile中的-m64 , arm平台是32位
sed -i "s/-m64//g" Makefile

#编译
make

#安装
make install 
