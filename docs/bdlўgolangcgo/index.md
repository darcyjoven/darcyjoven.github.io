# BDL调用golang(cgo)





## golang 编译

```go
package main

import "C"
import "fmt"

//export hello
func hello(){
    fmt.Println("hello world")
}
//export add
func add(a,b int) int {
    return a+b
}
func main(){
}

```

golang中要导出的函数前要增加备注`//export hello`，且必须写有`main`函数。

`import "C"`也是必须导入的。

使用命令
`go build -buildmode=c-shared -o xxx.so yyy` 进行编译产生.so和.h文件，其中xxx是.so的文件名，yyy是项目名称。

如果编译之后未产生.h 文件，说明没有导出任何函数，请检查go源码。

编译产生的.so文件运行时需要，需要加载到`$FGLDIR/lib`目录下，也可以`ln -s`创建软链接。

## C语言封装

BDL调用C语言可以见[BDL调用C语言](https://www.notion.so/call-c_ext-in-4gl)

源码如下：

```c
#include <stdio.h>
#include "f2c/fglExt.h"
#include "libsum.h"

int sum(int);
GoInt Sum(GoInt,GoInt);

UsrFunction usrFunctions[]={
  { "sum", sum, 2, 1 },
  { 0,0,0,0 }
};

int sum(int in_num){
    int s,a=0,b=0;
    popint(&a);
    popint(&b);
    s = Sum(a,b);
    pushint(s);
    return 1;
}

```

1. 产生.o 文件

```shell
gcc -c -I $FGLDIR/include -fPIC demo.c

```

1. 产生.so文件

```shell
gcc -shared -o libsuma.so demo.o  -L $FGLDIR/lib -lfgl -lsum

```

1. 将产生的.so文件放到`$FGLLDPATH`的路径中

## BDL调用

```sql
import libsuma
function main()
    define s integer

    call sum(2,3) returning s
    display sfmt("\\n2+3=%1",s)
end function

```

BDL调用时只要调用libsuma即可，libsum会在libsuma调用后自动加载。

[直接调用的.so](http://xn--gzut30b33azmr38f.so/) 在`$FGLLDPATH`目录，c调用的.so在`$FGLDIR/lib`目录。


