#### 暂存

暂存

`git stash` --可以把当前工作现场“储藏”起来，等以后恢复现场后继续工作

`git stash list` ---查看stash list

恢复stash，有2种办法：

1. 是用`git stash apply`恢复，但是恢复后，stash内容并不删除，你需要用`git stash drop`来删除；

2. 另一种方式是用`git stash pop`，恢复的同时把stash内容也删了

`git stash pop` ---恢复工作区

`git stash apply stash@{0}` ---申请恢复某个工作区