#!/bin/bash
# 同步notion到本地

echo -e "\033[4;36m开始同步mdbook...\033[0m"
# notion -> mdbook
./notion-md

echo -e "\033[4;36m开始同步blog...\033[0m"
# notion -> blog
./notion-blog

echo -e "\033[4;36m构建blog...\033[0m"
hugo --source ./blog

