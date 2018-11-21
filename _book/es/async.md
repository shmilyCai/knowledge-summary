async.md

async 函数就是 Generator 函数的语法糖

ES7的提案阶段


async函数对generator函数的改进

1. 内置执行器

2. 更好的语义， async表示函数有异步操作，await表示紧跟在后面的表达式需要等待结果

3. 更广的适用性


async函数的实现，就是将generator函数和自动执行器，包装在一个函数里

async函数返回一个promise对象，可以使用then方法添加回调函数

await命令后面的promise对象，运行结果可能是rejected，最好把await命令放在try...catch代码块中


















