# mdbook安装过程



# windows 安装

- RUST 官网下载 rustup-init.exe，linux系统按照sh文件安装

(https://www.rust-lang.org/)[https://www.rust-lang.org/]

![929949d8-d1c9-4f4d-90de-0e32ccc57cbe-Untitled.png](image/929949d8-d1c9-4f4d-90de-0e32ccc57cbe-Untitled.png)

不安装多余文件，选择3然后安装RUSTUP。



-  安装默认cargo

![8bb8b312-9bc3-4385-a6bd-86553a9c861e-Untitled.png](image/8bb8b312-9bc3-4385-a6bd-86553a9c861e-Untitled.png)

![d33f6793-f956-4f79-8d79-837a00aebbbf-Untitled.png](image/d33f6793-f956-4f79-8d79-837a00aebbbf-Untitled.png)

检查是否安装成功

![51481919-4d9f-4ee7-8f0d-826cf7749550-Untitled.png](image/51481919-4d9f-4ee7-8f0d-826cf7749550-Untitled.png)



- 安装mdbook



`cargo install mdbook`



- 以上为windows安装方式，发现安装时缺少很多文件，放弃，因为不想用mdbook需要安装一个vs。后面是linux 的教程，系统是ubuntu。

`rustup self uninstall`，卸载已安装的rustup



# linux 安装

-  安装rust

![203bb7c1-22db-4ec9-85d6-a3cea30eb217-Untitled.png](image/203bb7c1-22db-4ec9-85d6-a3cea30eb217-Untitled.png)

- 安装mdbook

`cargo install mdbook`

- WSL2 使用本机proxy

`export ALL_PROXY=“http://192.168.1.1:7890”` 192.168.1.1是本机的IP

- 在需要的目录初始化mdbook

`mdbook init`

![42fc8ae5-571c-4368-b116-199f627f28b8-Untitled.png](image/42fc8ae5-571c-4368-b116-199f627f28b8-Untitled.png)

## mdbook 使用

- <code>mdbook build</code>

发布为html，默认为book目录

`dbook build `**`--dest-dir`**** 指定目的文件夹**

- <code>mkbook watch</code>

实时转为html

- <code>mkbook serve</code>

打开网页服务，并实时显示

- <code>mkbook clean</code>

清除已build的内容

### mermaid 插件安装

- <code>cargo install mdbook-mermaid</code>

- 安装到要使用的目录

`mdbook-mermaid install ./`

![c82a5586-9b9e-4ae3-8cbc-aae2226ccb88-Untitled.png](image/c82a5586-9b9e-4ae3-8cbc-aae2226ccb88-Untitled.png)

- 额外语言支持

theme/highlight.js 使用此文件替换mdbook默认文件




