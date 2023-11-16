---
title: ssh密钥使用
subTitle: ""
date: 2023-11-16T10:34:03.331871222+08:00
author: darcy
authorLink: darcyjoven.com
resources: []
tags:
- ssh
- 远程开发
categories:
- 软件安装
toc:
  enable: true
  auto: true
linkToMarkdown: true
code:
  copy: true

---
```mermaid
graph LR
	subgraph 6.服务端验证完毕:
	end 
	subgraph 5.客户端发送验证后资料:
		j["客户端"]--私钥解密-->k["服务端"]
	end
	subgraph 4.客户端请求服务段验证:
		e["服务端"]--随机数据-->g["客户端"]
	end 
	subgraph 3.客户端访问客户端:
		d["客户端"]-->f["服务端"]
	end
	subgraph 2.私钥放到服务端:
		h["私钥"]--放置-->i["服务端"]
	end 
	subgraph 1.产生密钥:
		a["客户端"]--生成-->b["公钥"]
	  a--生成-->c["私钥"]
	end

	
```



-  产生ssh密钥

```shell
#产生ssh密钥
>  ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (C:\Users\darcy/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in C:\Users\darcy/.ssh/id_rsa
Your public key has been saved in C:\Users\darcy/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:NezN7f4OQQ183iHvX17y6QLijOTIDoWzhozgvo/tras darcy@darcy
The key's randomart image is:
+---[RSA 3072]----+
|             ..  |
|         .   ..+.|
|          +   +o+|
|    .    o + o .o|
|.  o .  S . o +  |
|= . +  . . . ..oo|
|.+ +. + + . . o+=|
|. + oo o o   o o+|
| E=*+o        ++o|
+----[SHA256]-----+
```



