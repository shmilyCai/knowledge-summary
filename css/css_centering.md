#### css居中

#### 水平方向的居中

水平居中行内元素(比如链接或者文本)

```
<header>
  This text is centered.
</header>

<nav role='navigation'>
  <a href="#0">One</a>
  <a href="#0">Two</a>
  <a href="#0">Three</a>
  <a href="#0">Four</a>
</nav>  

header, nav {
  text-align: center;
  background: white;
  margin: 20px 0;
  padding: 10px;
}

nav a {
  text-decoration: none;
  background: #333;
  border-radius: 5px;
  color: white;
  padding: 3px 8px;
}
```

水平居中块级元素

```
 <main>
  <div class="center">
    I'm a block level element and am centered.
  </div>
</main>

main {
  background: white;
  margin: 20px 0;
  padding: 10px;
}

.center {
  margin: 0 auto;
  width: 200px;
  background: black;
  padding: 20px;
  color: white;
}
```

水平居中多个块级元素

```
<main class="flex-center">
  <div>
    I'm an element that is block-like with my siblings and we're centered in a row.
  </div>
  <div>
    I'm an element that is block-like with my siblings and we're centered in a row. I have more content in me than my siblings do.
  </div>
  <div>
    I'm an element that is block-like with my siblings and we're centered in a row.
  </div>
</main>

main {
  background: white;
  margin: 20px 0;
  padding: 10px;
}

main div {
  background: black;
  color: white;
  padding: 15px;
  max-width: 125px;
  margin: 5px;
}

.inline-block-center {
  text-align: center;
}
.inline-block-center div {
  display: inline-block;
  text-align: left;
}

.flex-center {
  display: flex;
  justify-content: center;
}
```

```
<main>
  <div>
    I'm an element that is block-like with my siblings and we're centered in a row.
  </div>
  <div>
    I'm an element that is block-like with my siblings and we're centered in a row. I have more content in me than my siblings do.
  </div>
  <div>
    I'm an element that is block-like with my siblings and we're centered in a row.
  </div>
</main>

main {
  background: white;
  margin: 20px 0;
  padding: 10px;
}

main div {
  background: black;
  margin: 0 auto;
  color: white;
  padding: 15px;
  margin: 5px auto;
}

main div:nth-child(1) {
  width: 200px;
}
main div:nth-child(2) {
  width: 400px;
}
main div:nth-child(3) {
  width: 125px;
}

```

#### 垂直方向的居中

###### 垂直居中行内元素(比如链接或者文本)

单行

```
vertical-align: middle;
```

多行

```

```

###### 垂直居中块级元素

知道元素的高度

```

```

不知道元素的高度

```

```

######  使用flexbox

```

```

####水平垂直都居中

元素的宽高固定
```

```

元素的宽高不固定

```

```

使用flexbox

```
main {
  background: white;
  height: 200px;
  width: 60%;
  margin: 0 auto;
  padding: 20px;
  display: flex;
  justify-content: center; 
  align-items: center;
  resize: both;
  overflow: auto;
}

main div {
  background: black;
  color: white;
  width: 50%;
  padding: 20px;
  resize: both;
  overflow: auto;
}
<main>
  <div>
     I'm a block-level-ish element of an unknown width and height, centered vertically within my parent.
  </div>
</main>
```