---
title: 新增BLOG
subTitle: 本文介绍BDL中如何调用C语言动态链接库。
date: 2023-11-16T14:30:06.399752829+08:00
author: darcy
authorLink: darcyjoven.com
resources: []
tags:
- c语言
- linux
- bdl
categories:
- 编程问题
toc:
  enable: true
  auto: true
linkToMarkdown: true
code:
  copy: true

---


## 引入`fglExt.h`头文件

`fglExt.h` 在`$FGLDIR/include/f2c`目录下，我们需要用到暴露函数的结构体`UsrFunction`和出栈`popvchar`入栈`pushvchar`函数。

> 返回值和参数值不同类型请用不同的出栈入栈函数，popint、pushint等

以下示例，使用C语言新增函数`base64Decode`、`base64Encode`，用来base64格式的编码和解码。

## 编写代码

### 项目结构

为了方便后期维护，我将功能函数和函数暴露定义放在量个文件中，如下所示。

- <code>base64.c</code>

- <code>base64ext.c</code>

功能函数就是实际处理逻辑，功能暴露函数定义了运行中传参、返回值个数、需要暴露的函数名称等参数。

为了后续可以增加多个函数，所以将暴露函数文件单独写。后面要引入其它功能函数，直接在这个文件中添加即可。实际你写在一个文件中也是没问题的。

{{< admonition tip "c代码路径" true >}}
源代码的路径可以在服务器任何位置，只要在服务器能够编译即可。
{{< /admonition >}}

### 逻辑函数

我的代码中主要函数是这两个，一个编码一个解码，若要希望BDL能直接调用，需要封装一下。

```c
char*	base64_decode(const char* str);
char*	base64_encode(const char* str);

```

函数的签名为`int func(int);`，此函数返回的是返回值数量，参数为BDL调用时的数量。

```c
int base64Encode(int in_num){
    const int sz = 5000;
    char src[sz];
    char *ret;
    // assert需导入断言库<assert.h>，可以不用
    assert(in_num==1);
    // 取参数
    // popvchar取出当前栈最上面的参数，需导入头文件"f2c/fglExt.h"，才能使用
    // 如果有多个参数，第一次取得值是最后一个参数，后入先出
    popvchar(src,sz);
    if (*src == '\\0') {
        // pushvchar 返回值，如果有两个返回值，则调用两次pushvchar
        pushvchar("", 0);
        return 1;
    }
    ret = base64_encode(src);
    pushvchar(ret, strlen(ret));
    return 1;
}

```

### 向外暴露函数

处理逻辑处理，还需要向外部暴露函数。`base64ext.c`

暴露函数得时候，使用一个结构体UsrFunction数组，其中：

- 是结束标志，必须以这个结束

- 每一行都是向BDL暴露一个函数

- 第一个参数为暴露得函数名，即BDL中要调用得名字

- <code>int func(int)</code>

- 第三个参数为参数数量

- 第四个参数为返回值数量

- ，表示数量可以变

```c
#include "f2c/fglExt.h"

// 申明函数签名
int base64Encode(int);
int base64Decode(int);

UsrFunction usrFunctions[]={
  { "base64Decode", base64Decode, 1, 1 },
  { "base64Encode", base64Encode, 1, 1 },
  { 0,0,0,0 }
};

```

## 编译

1. 编译c源文件

```shell
gcc -c -I $FGLDIR/include -fPIC base64.c
gcc -c -I $FGLDIR/include -fPIC base64ext.c

```

此步将在当前目录产生对应的.o文件。

1. 链接为so文件

```shell
gcc -shared -o libbase64.so base64.o base64ext.o -L$FGLDIR/lib -lfgl

```

此步产生so文件，so文件是我们运行时需要的文件，其它文件运行时都不需要。

1. so文件移动到`$FGLLDPATH`的目录中

`$FGLLDPATH`目录可以在`$TOP/bin/tiptop_env`文件中设置，所有的42m目录都在`$FGLLDPATH`中。

## 调用

在BDL中只要importhi后即可使用这两个函数。

```sql
import libbase64
function main()
    define str1, str2 varchar(100)
    call base64Encode("Hello World!") returning str1
    call base64Decode(str1) returning str2
    display ""
    display "str1 is "||str1
    display "str2 is "||str2
end function

```

## 源码

`base64.c`

```c

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include "f2c/fglExt.h"

char*	base64_decode(const char* str);
char*	base64_encode(const char* str);
int base64Encode(int);
int base64Decode(int);

char*	base64_decode(const char* str){
	unsigned char imap[79]={62,0,0,0,63,52,53,54,55,56,57,58,59,60,61,0,0,0,0,0,0,0,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,0,0,0,0,0,0,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50};
	int rest_count =0;
	int buf_idx=0;
	int len = strlen(str);
	int flen = len;
    int i;
	while(str[flen-1]=='=')
		flen--;
	int buflen = flen*6/8+1;
	unsigned char* buf = (unsigned char*) malloc(buflen);
	memset(buf,'\\0',buflen);
	for(i=0;i<flen;i++){
		unsigned char c=imap[str[i]-43];
		int mcount = rest_count ==0?-2:6-rest_count;
		unsigned char c0 = (mcount>0?c>>mcount:c<<-mcount);
		buf[buf_idx] = buf[buf_idx] | c0;
		rest_count= mcount <0 ? -mcount : 8-mcount;
		if(mcount>=0)
			buf[++buf_idx]=c<<rest_count;
	}
	return buf;
}

char*	base64_encode(const char* str){
	char map[65]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	int len =strlen(str);
	int buflen = len * 8 / 6 + 4;//缺位补齐1 俩等号2 最后0-1位
	unsigned char* buf = (unsigned char*)malloc(buflen);
	memset(buf,'\\0',buflen);
	char a [4];
    int i;
	int rest_count = 0;
	int index = 0;
	int buf_idx =0 ;
	unsigned char last  = 0;
	for( i=0;i<len;i++){
		unsigned char c = str[i];
		a[index]= (last<<(6-rest_count))&63;
		int get_count = 6-rest_count;
		a[index] = a[index] |  ( c >>(8-get_count));
		a[index]=map[a[index]];
		rest_count = 8-get_count;
		last = c;
		index = index==2?0:index+1;
		if(index==0){
			a[3]=map[c&63];
			memcpy(buf+buf_idx,a,4);
			buf_idx+=4;
			rest_count=0;
			last = 0;
		}
	}
	if(index!=0){
		a[index]= last<<(6-rest_count) & 63;
		a[index]=map[a[index]];
		memcpy(buf+buf_idx,a,index+1);
		buf[buf_idx+index+1]='=';
		buf[buf_idx+index+2]= rest_count ==2 ? '=':0;
	}
	return buf;
}

int base64Encode(int in_num){
    const int sz = 5000;
    char src[sz];
    char *ret;
    int *p;
    assert(in_num==1);
    // 取参数
    popvchar(src,sz);

    if (*src == '\\0') {
        pushvchar("", 0);
        return 1;
    }
    ret = base64_encode(src);
    pushvchar(ret, strlen(ret));
    return 1;
}
int base64Decode(int in_num){
    const int sz = 5000;
    char src[sz];
    char *ret;
    int *p;
    assert(in_num == 1);
    // 取参数
    popvchar(src,sz);

    if (*src == '\\0') {
        pushvchar("", 0);
        return 1;
    }
    ret = base64_decode(src);
    pushvchar(ret, strlen(ret));
    return 1;
}

```

`base64ext.c`

```c
#include "f2c/fglExt.h"

int base64Encode(int);
int base64Decode(int);

UsrFunction usrFunctions[]={
  { "base64Decode", base64Decode, 1, 1 },
  { "base64Encode", base64Encode, 1, 1 },
  { 0,0,0,0 }
};

```

