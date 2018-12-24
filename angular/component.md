# 组件

组件控制屏幕上被称为视图的一小片区域。

## 特点

1. 组件定义视图
	
2. 组件使用服务，通过依赖被注入到组件中，使得代码更加模块化，可复用，高效

3. 通过装饰器标出组件和服务的类型，并提供元数据

4. 组件类的元数据将组件类和一个用来定义视图的模版关联起来。模版把普通的html和指令与绑定标记组合起来。

5. 服务的元数据提供了一些信息，

6. 每个angular应用都至少有一个组件，即根组件，会把组件树和页面中的DOM连接起来，每个组件都会定义一个类，包含应用的数据和逻辑，并与HTML模版相关联。

7. @Component()装饰器表明紧随的那个类是一个组件，并提供模版和该组件专属的元数据

## 组件的元数据

```
@Component({
  selector:    'app-hero-list',   //
  templateUrl: './hero-list.component.html',
  providers:  [ HeroService ]
})
export class HeroListComponent implements OnInit {
/* . . . */
}
```

selector， css选择器，在模版HTML中找到了这个选择器对应的标签，就创建并插入该组件的一个实例。

templateUrl， 该组件的HTML模版文件相对于这个组件文件的地址

providers， 当前组件所需要的服务的一个数组

## 模版语法

很像标准的HTML，包含Angular的模版语法。

模版可以使用数据绑定来协调应用和DOM中的数据，

使用管道来显示出来之前对其进行转换，

使用指令来把程序逻辑应用到要显示的内容

模版会把HTML和Angular的标记组合起来，这些标记可以在HTML元素显示出来之前修改它们

模版中的指令会提供程序逻辑，而绑定标记会把你应用中的数据和DOM连接在一起。

数据绑定：

1. 事件绑定让应用可以通过更新应用的数据来响应目标环境下的用户输入

2. 属性绑定让应用数据中计算出来的值插入到HTML中

## 管道

管道可以让模版中声明显示值的转换逻辑

@Pipe装饰器的类中会定义一个转换函数，用来把输入值转换成供视图显示用的输出值

管道操作符（|）

## 生命周期钩子

通过实现生命周期钩子接口，可以窃听组件生命周期中的一些关键时刻--从新建，更新，销毁

可观察对象（Observable）和事件处理，如何在组件和服务中使用可观察对象来发布和订阅任意类型的消息。

通过实现一个或者多个Angular core库里定义的生命周期钩子接口

每个接口都有唯一的一个钩子方法，它们的名字是由接口再加上ng前缀构成的。如：OnInit接口的钩子方法叫做ngOnInit。

生命周期钩子方法：

ngOnChanges(), 当angular重新设置数据绑定输入属性时响应。

ngOnInit(), 再angular第一次显示绑定和设置指令/组件的输入属性之后，初始化指令/组件

ngDoCheck(), 检测，并在发生angular无法或者不愿意自己检测的变化时作出反应

ngAfterContentInit(), 当把内容投影进组件之后调用

ngAfterContentChecked(), 每次完成被投影组件内容的变更检测之后调用

ngAfterViewInit(), 初始化完组件视图及其子视图之后调用

ngAfterViewChecked(), 每次做完组件视图和子视图的变更检测之后调用

ngOnDestroy()，当angular每次销毁指令/组件之前调用

## constructor

* 用于service注入
* 定义初始化数据

与ngOnInit()区别：

* constructor钩子只会被调用一次，用于依赖注入或者执行简单的数据初始化操作
* ngOnInit用于执行组件的其它初始化操作或者获取组件输入的属性值


## @Input和@Output

@Input

@Output， EventEmitter

## @ViewChild和@ViewChildren

@ViewChil，属性装饰器，用来从模版视图中获取匹配的元素，可在ngAfterViewInit钩子函数中，获取中获取正确的元素

@ViewChildren，属性装饰器，用来从模版视图中获取匹配的多个元素，返回的结果是一个QueryList集合

## @ContentChild和ContentChildren

## @HostListener和@HostBinding

@HostListener，设置宿主元素的事件监听信息

@HostBinding， 动态设置宿主元素的属性值

## ElementRef


## 不同组件之间的传递数据

1. 路由
2. service
3. @Input，属性装饰器，用于父组件向子组件传递数据
4. @Output，属性装饰器，用来定义组件内的输出属性，用于实现子组件将信息通过事件的形式通知到父级组件
5. 模版变量
6. @viewChild
7. MessageService，基于RxJS Subject
8. 实现$broadcast

Pub(发布)-Sub(订阅)模式








































