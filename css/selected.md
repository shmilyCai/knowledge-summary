#### 选择器

```
element1~element2: 选择前面有element1元素的每个element2元素。
[attribute^=value]: 选择某元素attribute属性是以value开头的。
[attribute$=value]: 选择某元素attribute属性是以value结尾的。
[attribute*=value]: 选择某元素attribute属性包含value字符串的。
E:first-of-type: 选择属于其父元素的首个E元素的每个E元素。
E:last-of-type: 选择属于其父元素的最后E元素的每个E元素。
E:only-of-type: 选择属于其父元素唯一的E元素的每个E元素。
E:only-child: 选择属于其父元素的唯一子元素的每个E元素。
E:nth-child(n): 选择属于其父元素的第n个子元素的每个E元素。
E:nth-last-child(n): 选择属于其父元素的倒数第n个子元素的每个E元素。
E:nth-of-type(n): 选择属于其父元素第n个E元素的每个E元素。
E:nth-last-of-type(n): 选择属于其父元素倒数第n个E元素的每个E元素。
E:last-child: 选择属于其父元素最后一个子元素每个E元素。
:root: 选择文档的根元素。
E:empty: 选择没有子元素的每个E元素（包括文本节点)。
E:target: 选择当前活动的E元素。
E:enabled: 选择每个启用的E元素。
E:disabled: 选择每个禁用的E元素。
E:checked: 选择每个被选中的E元素。
E:not(selector): 选择非selector元素的每个元素。
E::selection: 选择被用户选取的元素部分。
```