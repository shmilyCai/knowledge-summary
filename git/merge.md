#### Merge

https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001375840202368c74be33fbd884e71b570f2cc3c0d1dcf000

合并分支的2种方式

```
git checkout feature
git merge master

# 或者直接指定两个分支：
git merge master feature
```
这样操作后会在 feature 分支上产生一个新的 commit, 这个commit就是包含了 master 分支的修改。同时历史记录中也会包含这个 commit 的信息

好处就是：merge 是 non-destructive 的操作，比较安全。（相对于rebase操作） 

问题就是：如果merge频繁，那么 feature 分支的历史记录中会包含很多个由于 merge 产生的新 commit 信息

```
//慎用
git checkout feature
git rebase master // 将 master 上的修改合并到 feature 分支（当前分支）。
```

rebase 会将 feature 上的历史 commit 全部修改，并且用新的提交覆盖之。 

看起来就是你的 feature 分支从一个开始就是在最新的 master 上开发的( 新的master跑到了你分支的最开始处 )。

一个注意点就是不要将 master 分支 rebase 到其他分支上面。这样会导致该 master 分支和其他人的 master 分支的历史记录不一样。然后你还得将你的 master 分支与别人的master分支merge


##### 解决冲突
```
git mergr master
//存在冲突
git status //查看冲突文件

git add <filename> //添加冲突的文件

git commit -m "conflict fixed" //备注

git push
```