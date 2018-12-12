####日常使用的操作

 更新和提交

`git status` ---查看当前状态

`git add .` ---添加全部

`git commit -am"test"` ---添加test的注释

`git pull --rebase` ---更新远程仓库到本地

`git push` --- 提交

---

遇见冲突后，先解决冲突

`git add .` --- 添加全部

`git rebase --continue` ---继续

`git push` ---向远程仓库提交

---

tags

`git tag -a v1.01 -m "Relase version 1.01"`

`git push -tags`

---

在test分支下合并master分支的更新

如果文件同一行都有修改就会冲突，如果没有冲突就会自动 merge 

如果一个文件删除了，为什么 merge 时还存在？这个应该是在另一个分支上对该文件做了修改。

```
git checkout test
git merge master
git push 
```

---

git checkout -b 本地分支名x origin/远程分支名x  --- 通过远程分支新建本地分支

git push --set-upstream origin develop-hbb 推送分支

git config user.name ---查看用户名

git config user.email ---查看email

git config --global user.name "your name" --- 修改用户名

git config --global user.email "your email" ---修改email


---

git branch --set-upstream-to=origin/<gxxw> gxxw  本地分支与远程分支关联

git branch -vv 查看本地分支与远程分支的关联情况



