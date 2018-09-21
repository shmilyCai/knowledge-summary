#### gitbook周五的发布版本命令

记录下该book在周五的时候，更新gh-pages下的文件

```
git checkout gh-pages
```
```
rm -rf  *
```
```
git checkout master _book 
```
```
cp  -ri  /Users/caiyali/git/github/knowledge-summary/_book/*  /Users/caiyali/git/github/knowledge-summary
```
```
rm -rf _book
```