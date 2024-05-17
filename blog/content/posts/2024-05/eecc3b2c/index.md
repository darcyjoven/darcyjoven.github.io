---
title: BDL部分开发问题
subTitle: 开发中会遇到的问题
date: "2024-05-17T00:12:40.956Z"
author: darcy
authorLink: darcyjoven.com
tags:
    - BDL
    - tiptop
categories:
    - language
toc:
    enable: true
    auto: true
linkToMarkdown: true
code:
    copy: true
slug: eecc3b2c-483f-413f-8374-647664b8e325

---
# DISPLAY 触发不了 DEFORE DISPLAY问题

利用page 标签 action 属性触发



# 主动触发row change

```4gl
IF g_sfdc_d[l_ac].sfdc005 != g_sfdc_d_o.sfdc005 END IF
    CALL DIALOG.setFieldTouched("s_detail2.*", TRUE)
END IF
```

# 修改部分字体大小

- 找到4st文件目录，此文件影响所有作业格式，修改前务必备份

![52f8d5de-7ba7-4730-a837-bf5b66825135-Untitled.png](image/52f8d5de-7ba7-4730-a837-bf5b66825135-Untitled.png)

- 修改4st文件，增加Menu的字体大小，还可以修改颜色，字体类型等

![fe810ac7-30a8-4ce8-90d7-f47819b67a99-Untitled.png](image/fe810ac7-30a8-4ce8-90d7-f47819b67a99-Untitled.png)

修改后如下

![780ecc58-9136-479a-8cb0-a783cbf16321-Untitled.png](image/780ecc58-9136-479a-8cb0-a783cbf16321-Untitled.png)

其它字段可以自己摸索，'Menu'关键字是根据，DEBUG TREE找到，CTRL+右键 画面空白处可打开。

![a9b3180d-a69a-4121-8617-b4ff111e7c05-Untitled.png](image/a9b3180d-a69a-4121-8617-b4ff111e7c05-Untitled.png)



# 取当前时间

```4gl
DEFINE d1, d2 DATETIME YEAR TO FRACTION(3)
LET d1 = CURRENT YEAR TO FRACTION(3) 
LET d2 = "1998-01-23 12:34"
DISPLAY d1, d2
YEAR
MONTH
DAY
HOUR
MINUTE
SECOND
FRACTION
FRACTION(1)
FRACTION(2)
FRACTION(3)
FRACTION(4)
FRACTION(5)
```

# **fglWrt 授权查询**

`fglWrt -a info`



# **sed 截取文件**

`sed -n '100,200p'  123.xml >> 12.xml `
将`123.xml` 中从100行到200行内容复制到`12.xml`这个文件中。

<aside>
💡 用处：大文件日志，不方便下载，其中的报文又不好复制的时候，可以用这个命令将需要的内容切割出来.
</aside>



# **grep 命令**

- 直接用就是查询所有匹配内容

- 参数 -l

`grep -l "hello,world!"  file_name`

- 参数 **-wo**

`grep -wo "keyword" filename |wc -l`

- 参数 -rn 这个参数可以查询匹配的文件名和所在行数

`grep -rn "hello,world!" file_name`



# 修改日期格式

```shell
export DBDATE=Y4MD/

设置debug时，日期变为'yyyy/mm/dd'格式，不设置为'yy/mm/dd'
```

