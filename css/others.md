#### CSS3

#####边框

CSS3新增了三个边框属性，分别是border-radius、box-shadow和border-image。border-radius可以创建圆角边框，box-shadow可以为元素添加阴影，border-image可以使用图片来绘制边框。IE9+支持border-radius和box-shadow属性。Firefox、Chrome以及Safari支持所有新的边框属性。

---

#####背景

CSS3新增了几个关于背景的属性，分别是background-clip、background-origin、background-size和background-break。

background-clip属性用于确定背景画区，有以下几种可能的属性：

background-clip: border-box; 背景从border开始显示
background-clip: padding-box; 背景从padding开始显示
background-clip: content-box; 背景显content区域开始显示
background-clip: no-clip; 默认属性，等同于border-box
通常情况，背景都是覆盖整个元素的，利用这个属性可以设定背景颜色或图片的覆盖范围