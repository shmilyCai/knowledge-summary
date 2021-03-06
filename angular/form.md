# 表单-form

## 模版驱动式表单

类似于angularjs1中的表单

特点：
1. 使用方便
2. 适用于简单的场景
3. 通过[(ngModal)]实现双向绑定
4. 自动生成Form Model（异步）
5. 最小化组件类的代码


## 响应式表单

特点：
1. 比较灵活
2. 适用于复杂的场景
3. 简化了HTML模版的代码，把验证逻辑抽离到组件类中
4. 手动创建Form Model
5. 方便的跟踪表单控件值的变化
6. 易于动态添加表单控件

构建响应式表单时：

	* 组件是“真理之源”。表单验证在组件代码中定义。
	* 在组件类中，使用 new FormControl() 或者 FormBuilder 显性地创建每个控件。
	* 模板中的 input 元素不使用 ngModel。
	* 相关联的 Angular 指令全部以 Form 开头，例如 FormGroup()、FormControl() 和 FormControlName()。