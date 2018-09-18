#### 常用样式说明

计算最大宽度

当你使用calc来计算元素的高度的时候你要注意, 计算的高度是依赖于父级元素的高度的, 所以, 你需要先设置父级元素的高度s

```
max-width: calc(100% - 94px);

.container {
    height: 100vh;  /* 使用vh这个单位来设置高度为100% */
}

.content {
  width: 100%;  
  height: calc(100% - 150px);
  background-color: #aaaaaa;
}

```
强制段落换行
```
word-break: break-all|keep-all;
word-wrap: break-word;
```

超出省略号
```
overflow:hidden;
white-space:nowrap; 
text-overflow:ellipsis;
-webkit-line-clamp: 2; //超出2行显示省略号
-webkit-box-orient: vertical; ////超出2行显示省略号
```

垂直居中一切元素

```
html, body {
  height: 100%;
  margin: 0;
}

body {
  display: -webkit-flex;
  display: flex;
  -webkit-align-items: center;  
  -ms-flex-align: center;  
  align-items: center;
}
```

制作箭头
```
/* 向下的箭头 */
.caret {
    display: inline-block;
    width: 0;
    height: 0;

    vertical-align: middle;
    
    /* 如果需要向上的箭头的话, 就把border-top改为border-bottom */
    border-top: 20px solid;
    border-right: 20px solid transparent;
    border-left: 20px solid transparent;
}
```

让footer永远位于屏幕底部, 并随内容而拉伸
```
<div class="header"></div>
<div class="content"></div>
<div class="footer"></div>

html {
    height: 100%;
}

body {
    position: relative;
    min-height: 100%;

    &:after {
        display: block;
        content: '';
        height: 200px; /* 此处的高度必须和footer的高度相同 */
    }
}

.footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    height: 200px;
}
```

CSS避免图片超出包含块
```
img {
    display: block;
    max-width: 100%;
    margin: 0 auto;
}
```

带有分割线的导航
```
.nav li:not(:last-child) {
    border-right: 1px solid #cccccc;
}
```

设置全屏图片

1. 设置全屏背景图
```
html {
    background: url('the/path/to/your/image') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='.myBackground.jpg', sizingMethod='scale');
    -ms-filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='myBackground.jpg', sizingMethod='scale')";
}
```

2. 使用img标签的全屏图片
```
<div class="bg">
    <img src="the/path/to/your/image" alt="">
</div>
.bg {
    position: fixed;
    top: -50%;
    left: -50%;

    width: 200%;
    height: 200%;
}

.bg img {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    min-width: 50%;
    min-height: 50%;
}
```

清除浮动
```
.container {
    width: 800px;
    padding: 20px;
    border: 1px solid #aaaaaa;
    overflow: hidden; /* or set to auto */
}
```

去除display为inline-block的li之间的间隙
```
ul {
    font-size: 0;
    
    /* 以下两句视不同情况而定 */
    letter-spacing: -1px;
    word-spacing: -1px;
}

ul li {
    font-size: 16px;
    letter-spacing: normal;
    word-spacing: normal;
}
```


实现图片预加载
```
#preload-01 { background: url(http://domain.tld/image-01.png) no-repeat -9999px -9999px; }
#preload-02 { background: url(http://domain.tld/image-02.png) no-repeat -9999px -9999px; }
#preload-03 { background: url(http://domain.tld/image-03.png) no-repeat -9999px -9999px; }
```

避免闪烁

如果我们的内容在图片加载好之前渲染好的话, 我们可能会看到包含块被撑开的一个过程, 这个过程就叫做闪烁
```
<div class="container">
    <img src="the/path/to/your/image" alt="" />
</div>
.container {
    positiong: relative;
    width: 100%;
    max-height: 500px;
    background-color: red;
    
    /* 避免编边距折叠 */
    overflow: hidden;
}

.container:after {
    content: '';
    display: block;
    margin-top: 50%; /* 或者设置padding-top: 50%; */
}
```

制作图片加载失败的效果
```
img:before {  
  content: "We're sorry, the image below is broken :(";
  display: block;
  margin-bottom: 10px;
}

img:after {  
  content: "(url: " attr(src) ")";
  display: block;
  font-size: 12px;
}
```