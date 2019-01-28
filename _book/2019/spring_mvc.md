# spring_mvc

框架原理

	在Spring MVC框架中，从“Request（请求）”开始，依次进入“DispatcherServlet（核心分发器）” —> “HandlerMapping（处理器映射）” —> “Controller（控制器）” —> “ModelAndView（模型和视图）” —> “ViewResolver（视图解析器）” —> “View（视图）” —> “Response（响应）”结束，其中DispatcherServlet、HandlerMapping和ViewResolver 只需要在XML文件中配置即可，从而大大提高了开发的效率，特别是对于 HandlerMapping 框架为其提供了默认的配置
