---
title: git stash 使用
subTitle: 在修改代码的过程中，想起来或者发现远程中有为同步到本地的commit，可以使用此功能。
date: 2023-11-16T10:34:05.668191165+08:00
author: darcy
authorLink: darcyjoven.com
resources: []
tags:
- git
categories:
- 软件安装
- 软件使用
toc:
  enable: true
  auto: true
linkToMarkdown: true
code:
  copy: true

---
- git stash 是储藏的意思

![74e6821d-d9db-464c-95dd-e7c02ab67150-Untitled.png](image/74e6821d-d9db-464c-95dd-e7c02ab67150-Untitled.png)

本地代码落后远程一此commit，但是本地又修改了代码，不希望本地增加一次提交，可以使用git stash。



git stash 是将本地修改的内容暂时保存，当远程同步后，再将暂时保存的内容取出修改。



![49100893-e832-457f-bb3c-7077b6c9704e-Untitled.png](image/49100893-e832-457f-bb3c-7077b6c9704e-Untitled.png)

![4d2c7414-9514-4ad7-b6e8-18063e64f255-Untitled.png](image/4d2c7414-9514-4ad7-b6e8-18063e64f255-Untitled.png)



![96287797-1a17-4228-9819-fabe666491a2-Untitled.png](image/96287797-1a17-4228-9819-fabe666491a2-Untitled.png)



git stash pop 取出最近一次暂存代码

![af273173-0db7-4910-98d1-b8e830abde3e-Untitled.png](image/af273173-0db7-4910-98d1-b8e830abde3e-Untitled.png)



再次查看已经没有差异

![36661a1f-f442-4271-9007-8ca972b64bcd-Untitled.png](image/36661a1f-f442-4271-9007-8ca972b64bcd-Untitled.png)



