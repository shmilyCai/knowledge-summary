#### transform

Transform用来向元素应用各种2D和3D转换，该属性允许我们对元素进行旋转、缩放、移动或倾斜等操作

```
div{
    transform:rotate(7deg);
    -ms-transform:rotate(7deg);     /* IE 9 */
    -moz-transform:rotate(7deg);    /* Firefox */
    -webkit-transform:rotate(7deg); /* Safari 和 Chrome */
    -o-transform:rotate(7deg);  /* Opera */
}
```

transform可以有各种变换类型

```
none: 定义不进行转换。
matrix(n,n,n,n,n,n): 定义2D转换，使用六个值的矩阵。
matrix3d(n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n): 定义3D转换，使用16个值的4x4矩阵。
translate(x,y): 定义2D位移转换。
translate3d(x,y,z): 定义3D位移转换。
translateX(x): 定义位移转换，只是用X轴的值。
translateY(y): 定义位移转换，只是用Y轴的值。
translateZ(z): 定义3D位移转换，只是用Z轴的值。
scale(x,y): 定义2D缩放转换。
scale3d(x,y,z): 定义3D缩放转换。
scaleX(x): 通过设置X轴的值来定义缩放转换。
scaleY(y): 通过设置Y轴的值来定义缩放转换。
scaleZ(z): 通过设置Z轴的值来定义3D缩放转换。
rotate(angle): 定义2D旋转，在参数中规定角度。
rotate3d(x,y,z,angle): 定义3D旋转。
rotateX(angle): 定义沿着X轴的3D旋转。
rotateY(angle): 定义沿着Y轴的3D旋转。
rotateZ(angle): 定义沿着Z轴的3D旋转。
skew(x-angle,y-angle): 定义沿着X和Y轴的2D倾斜转换。
skewX(angle): 定义沿着X轴的2D倾斜转换。
skewY(angle): 定义沿着Y轴的2D倾斜转换。
perspective(n): 为3D转换元素定义透视视图。

```