# 模块

## NgModule特点

1. NgModule为组件提供了编译的上下文环境。

2. NgModule可以将其组件和服务关联起来，形成功能单元

3. AppModule，根模块，用来启动应用的引导机制，一个应用通常包含很多功能模块

4. 可导入和导出模块功能，供其他模块使用

5. 模块可以获得惰性加载（按需加载模块）的优点，已尽可能减小启动时需要加载的代码体积

## NgModule元数据

1. declarations(可声明对象表)，属于本NgModule的组件，指令，管道

2. exports，能在其他模块的组件模版中使用的可声明对象的子集

3. imports，导出本模块中的组件模版所需要的类的其他模块

4. providers，本模块向全局服务中贡献的服务的创建器，能在本应用中的任何部分使用。

5. bootstrap，应用的主视图，称为根组件，只有根模块才应该设置bootstrap属性

简单定义

```
import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
@NgModule({
  imports:      [ BrowserModule ],
  providers:    [ Logger ],
  declarations: [ AppComponent ],
  exports:      [ AppComponent ],
  bootstrap:    [ AppComponent ]
})
export class AppModule { }
```

## 与组件关系

NgModule为其中的组件提供了一个变异上下文环境。

根模块总会有一个组件，并在引导期间创建







































