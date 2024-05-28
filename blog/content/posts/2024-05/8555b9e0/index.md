---
title: RedHat6.5 GCC升级到4.8
subTitle: ""
date: "2024-05-28T08:08:44.590Z"
author: darcy
authorLink: darcyjoven.com
tags:
    - ""
categories:
    - ""
toc:
    enable: true
    auto: true
linkToMarkdown: true
code:
    copy: true
slug: 8555b9e0-0a1c-4c3c-90a3-f3eb7394e768

---
# 升级前版本信息

## red hat

```shell
[root@ERP-AP02 ~]# cat /etc/redhat-release
Red Hat Enterprise Linux Server release 6.5 (Santiago)
```

## GCC

```shell
[root@ERP-AP02 ~]# gcc -v
Using built-in specs.
Target: x86_64-redhat-linux
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable-java-awt=gtk --disable-dssi --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre --enable-libgcj-multifile --enable-java-maintainer-mode --with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libjava-multilib --with-ppl --with-cloog --with-tune=generic --with-arch_32=i686 --build=x86_64-redhat-linux
Thread model: posix
gcc version 4.4.7 20120313 (Red Hat 4.4.7-4) (GCC)
```

# 升级顺序

## ~~安装SCL~~

[https://prod-files-secure.s3.us-west-2.amazonaws.com/b1dbc1f7-4866-487d-86a2-41b94a254a88/fa71a4e6-eea0-402d-beb5-c49f2c53b5f3/centos-release-scl-rh-1-1.el6.centos.noarch.rpm?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45HZZMZUHI%2F20240528%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20240528T081944Z&X-Amz-Expires=3600&X-Amz-Signature=d309fb2d933dd594f758066359b54bc42fb2cf62d93a03a3687613861c8803d9&X-Amz-SignedHeaders=host&x-id=GetObject](https://prod-files-secure.s3.us-west-2.amazonaws.com/b1dbc1f7-4866-487d-86a2-41b94a254a88/fa71a4e6-eea0-402d-beb5-c49f2c53b5f3/centos-release-scl-rh-1-1.el6.centos.noarch.rpm?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45HZZMZUHI%2F20240528%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20240528T081944Z&X-Amz-Expires=3600&X-Amz-Signature=d309fb2d933dd594f758066359b54bc42fb2cf62d93a03a3687613861c8803d9&X-Amz-SignedHeaders=host&x-id=GetObject)

`rpm -ivh centos-release-scl-rh-1-1.el6.centos.noarch.rpm`

## 下载源码

wget http:[//ftp.gnu.org/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.bz2](https://ftp.gnu.org/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.bz2)

tar -jxvf  gcc-4.8.0.tar.bz2

## 下载依赖库

cd gcc-4.8.0

./contrib/download_prerequisites

cd ..

## 建立输出目录

mkdir gcc-build-4.8.0

## 产生makefile文件

cd  gcc-build-4.8.0

../gcc-4.8.0/configure --enable-checking=release --enable-languages=c,c++ --disable-multilib

## 编译

make -j4

## 安装

make install

## 切换新版本

updatedb

locate gcc-4.8|tail

ls /usr/local/bin | grep gcc

update-alternatives --install /usr/bin/gcc gcc /usr/local/bin/i686-pc-linux-gnu-gcc 40

