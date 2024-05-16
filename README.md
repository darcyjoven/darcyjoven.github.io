# blog

## 目录结构

## 构建命令

- hugo

```shell
hugo --source ./blog
# 或者
cd ./blog && hugo
```

- 同步notion内容到blog

- 同步notion内容到md/help

```shell
./notion
# notion.config.yaml
```

- 构建mdbook

```shell
cd md/help && mdbook build -d ../../docs/md/help
cd md/bdl && mdbook build -d ../../docs/md/bdl
```
- 提交并推送到github

- 备份产生压缩文件