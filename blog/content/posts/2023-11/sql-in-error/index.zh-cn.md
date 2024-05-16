---
title: in嵌套错误字段问题
subTitle: ""
date: 2023-11-16T10:34:04.812482973+08:00
author: darcy
authorLink: darcyjoven.com
resources:
- name: featured-image
  src: image/cover.jpg
tags:
- oracle
- sql
- 运维
categories:
- 系统运维
toc:
  enable: true
  auto: true
linkToMarkdown: true
code:
  copy: true

---
假设存在两个表：

```sql
create table darcy1(
	ima01  varchar(40),
	ima02  varchar(40),
	ima021 varchar(200)
);
create table darcy2(
	ima01  varchar(40),
	ima02  varchar(40)
)
```

运行下面代码不会出错，darcy2虽然没有ima021字段，但是SQL能匹配到darcy1有ima021字段，所以ima021字段被省略了。

```sql
select * from darcy1 where (ima01,ima02,ima021) in (
	select ima01,ima02,ima021 from darcy2 where ima01 like 'M%'
)
```

以上代码结果等价于：

```sql
select * from darcy1 where (ima01,ima02) in (
	select ima01,ima02from darcy2 where ima01 like 'M%'
)
```

所以嵌套的时候，如果两个表字段有可能重复，子查询中请尽量用表名.字段的形式。

