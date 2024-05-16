#!/bin/bash
# 提交信息commit
current_time=$(date "+%Y-%m-%d %H:%M:%S")
commit_msg="日常提交(时间:$current_time)"
echo $commit_msg

# add

git add .

# commit

git commit -m "$commit_msg"

# push

git push