#### css标准模型和怪异模型

在标准模式下，一个块的总宽度=width+margin(左右)+padding(左右)+border(左右)

在怪异模式下，一个块的总宽度=width+margin（左右）（既width已经包含了padding和border值）

---

CSS盒模型本质上是一个盒子，封装周围的HTML元素，它包括：边距，边框，填充，和实际内容

```
box-sizing: border-box;

box-sizing类似于标准盒模型，它会把内边距和边框包含在width内。

在实际工作中，我们设置一个固定宽度的盒子，但当给它设置padding、border之后，它的真正宽度就会改变。

这时box-sizing就派上用途了。

它会自动调整内容的宽度，保证盒子的真正宽度还是我们设置的宽度
```


