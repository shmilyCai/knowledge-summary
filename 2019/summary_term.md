# 前端常用名词说明

用简短的语言描述出各个计算机术语的意思，方便以后吹NB


## MVC

MVC，指数据（Model）与视图（View）分开，控制器（Control）管理逻辑和用户输入

## MVVM

MVVM，指数据（Model）与视图（View），VM（ViewModel）替代了C（Control），即数据的双向绑定。

## MVP

## Web Component

创建可重用的定制元素

1. HTML Template
2. Shadow DOM
3. Custom Element

## WebWorker

JavaScript是单线程并以事件循环为主

WebWorker允许在另一个线程中执行任务，解放主线程

允许

## 预先（AOT）编译

在编译期间将HTML和TypeScript代码转换成高效的JavaScript代码，浏览器可直接下载和运行。

优点：渲染更快，需要的异步请求更少，需要下载的angular框架体积更小，提早检测模版错误，更安全

## 即时编译（JIT）

会在运行期间在浏览器中编译应用

## service worker

即一段运行在web浏览器中，并为应用管理缓存的脚本

Service Worker在用户关闭浏览器页标签时仍然会被保留，下次浏览器加载本应用时，sw就会首先加载，然后拦截加载本应用时的对每一项资源的请求。

manifest文件描述要缓存的资源，用于新版本更新后，通知sw下载并缓存应用的一个新版本

## 服务端渲染（server-side rendering SSR）

将在服务端把页面预先生成html文件，作为静态文件工服务器使用，浏览器在请求时直接给出响应。

## TypeScript

1. 元数据
2. 装饰器
3. 模块（导入，导出，default）
4. 静态类型
5. 类型参数
6. 静态类型参数-范型

## 路由

## 响应式编程

## 函数式编程

把运算过程尽量写成一系列嵌套的函数调用。

函数为一等公民。

一等公民指函数与其他数据类型一样，可以赋值给其他变量，也可作为参数或者函数返回值

表达式指一个单纯的运算过程，总有返回值。

语句指执行某种操作，没有返回值。

函数式编程要求只使用表达式，不使用语句，并且都有返回值。

纯函数特点：
1. 给定相同的输入参数，总是返回相同的结果
2. 没有产生任何副作用（副作用指函数内做了与本身运算无关的事）
3. 没有依赖外部变量的值

前端中常见的副作用的场景：
1. 发送HTTP请求
2. 函数内调用logger函数，如console.log
3. 修改外部变量的值
4. 函数内执行DOM操作

函数式编程特点：
1. 不修改状态-利用参数保存状态
2. 引用透明-指函数的运行不依赖于外部变量或状态


## PWA

Progressive Web App（PWA），指渐进增强Web App，

fetch API，cacheStorage API，service worker，push API
























