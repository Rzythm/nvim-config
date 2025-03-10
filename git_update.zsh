#!/bin/zsh

# 检查是否传递了提交信息
if [ -z "$1" ]; then
  echo "请提供提交信息："
  exit 1
fi

# 执行 git add, commit 和 push
git add .
git commit -m "$1"  # 使用第一个参数作为提交信息
git push

# 输出操作完成的消息
echo "已成功提交并推送到远程仓库！"
