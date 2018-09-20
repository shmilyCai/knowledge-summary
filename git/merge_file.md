#### 将另一个分支的文件合并到新分支

https://www.cnblogs.com/phpper/p/7609238.html

1. 合并某个分支上的单个commit

```
git checkout master  
git cherry-pick 82ecb31
```

82ecb31就被合并到master分支，并在master中添加了commit（作为一个新的commit）。cherry-pick 和merge比较类似，如果git不能合并代码改动（比如遇到合并冲突），git需要你自己来解决冲突并手动添加commit。

这里git cherry-pick每次合并过来会显示文件冲突(其实并没有冲突代码部分，只需手动解决既可)


2. 合并某个分支上的一系列commitsss
```
git checkout featuregit 
git checkout -b newbranch 62ecb3
git rebase --ontomaster 76cada^ 
```

3.  某个文件f.txt合并到master分支上

如果只想将feature分支的某个文件f.txt合并到master分支上。
```
git checkout feature 
git checkout --patch master f.txt
```
第一个命令： 切换到feature分支；
第二个命令：合并master分支上f文件到feature分支上，将master分支上 f 文件追加补丁到feature分支上 f文件。你可以接受或者拒绝补丁内容。

如果只是简单的将feature分支的文件f.txt copy到master分支上；
```
git checkout master
git checkout feature f.txt

```