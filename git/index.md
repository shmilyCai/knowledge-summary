#### 将另一个分支的文件合并到新分支

如果只想将feature分支的某个文件f.txt合并到master分支上。
1: git checkout feature 
2: git checkout --patch master f.txt
第一个命令： 切换到feature分支；
第二个命令：合并master分支上f文件到feature分支上，将master分支上 f 文件追加补丁到feature分支上 f文件。你可以接受或者拒绝补丁内容。

如果只是简单的将feature分支的文件f.txt copy到master分支上；

git checkout master
git checkout feature f.txt
