#!/bin/sh

### 更新gh-pages下的文件
git checkout gh-pages
git branch
rm -rf *~
git checkout master _book 
cp -r _book/* .
rm -rf _book

#### 提交到git上
date=$(date +%Y%m%d)
git add .
git commit -am"$date-周五发布"
git push

git branch
git checkout master