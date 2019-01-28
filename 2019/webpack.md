# webpack

静态模块打包器，

核心概念：
1. 入口（entry）
2. 输出（output）
3. loader
4. 插件（plugins）

## 入口 entry

指webpack应该使用哪个模块，来作为构建其内部依赖图的开始。

```
module.exports = {
  entry: './path/to/my/entry/file.js'
};
```

## 出口 output

告诉webpack在哪里输出它所创建的bundles，以及如何命名这些文件，默认值为./dist

基本上，整个应用程序结构，都会被编译到你指定的输出路径的文件中

```
const path = require('path');

module.exports = {
  entry: './path/to/my/entry/file.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'my-first-webpack.bundle.js'
  }
};
```

## loader

loader让webpack能够处理那些非js文件，

## 插件 plugins

插件用于执行范围更广的任务，从打包优化和压缩，一直到重新定义环境中的变量。































