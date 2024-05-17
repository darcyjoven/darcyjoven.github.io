#!/bin/bash
# 提交信息commit
current_time=$(date "+%Y-%m-%d %H:%M:%S")
commit_msg="日常提交(时间:$current_time)"
echo -e "\033[1;32m开始push $commit_msg...\033[0m"

# add

git add .

# commit

git commit -m "$commit_msg"

# push

git push