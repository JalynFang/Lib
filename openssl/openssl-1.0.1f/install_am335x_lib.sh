#!/bin/sh

INSTALL_NAME="/am335x_install"
INSTALL_PATH_NAME=$PWD$INSTALL_NAME
CROSS_COMPILE_ENV="/usr/local/arm/crosschain/am335x/bin"
CROSS_COMPILE_PREFIX="/usr/local/arm/crosschain/am335x/bin/arm-arago-linux-gnueabi-"

echo "install lib path:"
echo $INSTALL_PATH_NAME 

#删除掉源码包
#rm -rf openssl-1.0.1f

#解压源码包
#tar -zxvf openssl-1.0.1f.tar.gz 

#这个版本的库make clean 会报错，估计就是因为这个原因，该库一旦编译过了，
#要再编译其他平台的代码将报错链接问题，所以编译其他平台就重新解压次了

cd openssl-1.0.1f/
make clean

#set compile env
export PATH=$PATH:$CROSS_COMPILE_ENV
export CC=arm-arago-linux-gnueabi-gcc



#config 
./config no-asm shared --prefix=$INSTALL_PATH_NAME --openssldir=$INSTALL_PATH_NAME"/ssl"

#去掉Makefile中的-m64 , arm平台是32位
sed -i "s/-m64//g" Makefile

#编译
make

#安装
make install 
