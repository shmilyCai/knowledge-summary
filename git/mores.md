####常用命令

`git clone` --- 将服务器上的文件更新下来

`git branch` --- 查看本地所有分支

`git branch -d test` --- 删除test分支，-D时为强制删除test分支

`git remote -v` --- 查看服务器上的所有分支的详细信息

`git remote` --- 查看远程库的信息

`git checkout filename` --- 重新更新该文件

`git checkout -b test` --- 创建test分支并切换到该分支

`git merge --no-ff test` ---  合并test分支, 普通模式合并，合并后的历史有分支，能看出来曾经做过合并,而fast forward合并就看不出来曾经做过合并，如：
`git merge --no-ff -m "merged bug fix 101" issue-101`

`git config` --- git配置信息

`git merge` ---合并

`git merge --abort` ---撤销合并

`git diff` ---查看修改内容，配合`git status`一起使用

`git log` --- 可以查看提交历史，以便确定要回退到哪个版本

`git reset --hard HEAD^` ---回退到上一个版本，`HEAD`指向的版本就是当前版本

上一个版本就是`HEAD^`，上上一个版本就是`HEAD^^`，当然往上100个版本写100个^比较容易数不过来，所以写成`HEAD~100`

`git reset --hard 1094a` ---回退到某个版本

`git reflog` ---查看命令历史，以便确定要回到未来的哪个版本

`git add <filename>` ---实际上就是把要提交的所有修改放到暂存区

`git commit -am"commit"` ---一次性把暂存区的所有修改提交到分支, 每次修改，如果不用`git add`到暂存区，那就不会加入到`commit`中


`git push -f https://github.com/shmilyCai/vue-ui.git master:gh-pages` ---快速提交dist文件
