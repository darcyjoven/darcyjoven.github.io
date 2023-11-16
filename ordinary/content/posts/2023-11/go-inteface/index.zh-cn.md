---
title: go 类型转换与断言
subTitle: ""
date: 2023-11-16T10:34:06.529883661+08:00
author: darcy
authorLink: darcyjoven.com
resources: []
tags:
- golang
categories:
- 编程问题
toc:
  enable: true
  auto: true
linkToMarkdown: true
code:
  copy: true

---


- 断言—接口断言为确定类型

```go
var greeting interface{} = "hello world"
greetingStr := greeting.(string)
```

- 类型转换—底层结构一致的类型相互转换

```go
greeting := []byte("hello world")
greetingStr := string(greeting)
```



