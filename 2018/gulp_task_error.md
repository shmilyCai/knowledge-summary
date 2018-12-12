# gulp build时报错

## Bug

gulp在打包前端文件时报以下错误：

```
assert.js:89
  throw new assert.AssertionError({
  ^
AssertionError: Task function must be specified
    at Gulp.set [as _setTask] (/var/jenkins_home/workspace/pulsar-pkg-ui-all-in-one-cd/pulsar-pkg-ui/node_modules/gulp/node_modules/undertaker/lib/set-task.js:10:3)
```

## 产生原因

gulp版本升级到4.0.0了，gulp4.0的task任务写法有变更

产品中的gulp打包文件部分代码为：

```
  gulp.task('gen:production', ['config:pro', 'config:urlPro', 'html', 'fonts', 'other']);
```

gulp4.0的打包文件写法为：(https://www.liquidlight.co.uk/blog/article/how-do-i-update-to-gulp-4/)

```
//以前的写法
gulp.task('default', ['del'], function() {
    // default task code here
});

//升级后的写法
gulp.task('default', gulp.series('del', function() { 
    // default task code here
}));

Note: because you are opening a parenthesis for gulp.series, don’t forget to add an extra closing one after the function.

Make sure you update the rest of your gulpfile to follow suit.

The gulp has updated this syntax for running tasks in series to add the functionality of running tasks in parallel with gulp.parallel. More can be read about it in the gulp docs.
```

综上，产品中的npm.json文件的版本为latest导致失败的

```
"gulp": "latest",
```

## 解决方法

将产品中的npm.json文件的版本为latest修改为`~3.9.1`

```
"gulp": "~3.9.1",
```

## 扩展学习

gulp.task()，定义自动执行的任务

gulp.src()，匹配文件

gulp.watch()，监视文件变化并执行指定任务

gulp.run()，运行

gulp.dest()，写入到目标文件

-- V4.0后新添加的

gulp.series(),

gulp.parallel(),








