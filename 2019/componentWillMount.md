# react被弃用的函数替换方案


## Bug

```
 error  componentWillReceiveProps is deprecated since React 16.999.0, use UNSAFE_componentWillReceiveProps instead, see https://reactjs.org/docs/react-component.html#unsafe_componentwillreceiveprops. Use https://github.com/reactjs/react-codemod#rename-unsafe-lifecycles to automatically update your components  react/no-deprecated
 
```

## 产生原因

componentWillReceiveProps这个在react16.3版本后被弃用，所以需要替换成其他的
，
最好先采用以下方式替换，因为不止这一个被弃用了，好像还有几个

## 解决方法

github解决方法地址：https://github.com/reactjs/react-codemod#rename-unsafe-lifecycles

1. yarn global add jscodeshift
2. git clone https://github.com/reactjs/react-codemod.git 到当前需要替换的文件目录下
3. cd reatc-codemod
4. yarn install
5. jscodeshift -t react-codemod/transforms/rename-unsafe-lifecycles.js  src
6. 只能替换大多数文件，有2个文件需要手动替换

```

/Users/caiyali/git/study/react-admin/src/router/index.js

/Users/caiyali/git/study/react-admin/src/a_container/Login/index.js

/Users/caiyali/git/study/react-admin/src/a_container/System/PowerAdmin/index.js

componentWillMount is deprecated since React 16.999.0, use UNSAFE_componentWillMount

###
UNSAFE_componentWillMount 替换 componentWillMount，

```

 最后删除reatc-codemod文件夹

## 扩展学习

1. react16.3后废弃componentWillMount，componentWillReceiveProps和componentWillUpdate，新版本中是在前面加 UNSAFE_ 前缀
2. 新增的getDerivedStateFromProps和getSnapshotBeforeUpdate
3. 框架版本更新的太快

