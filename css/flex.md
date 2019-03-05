# Flex

## 什么是flex？

采用flex布局的元素，称为flex容器。
子元素自动成为成员，称为flex项目。

main-axis, main-start, main-end
cross-axis, cross-start, cross-end

### flex-direction，决定项目的排列方向

4个值：
1. row（默认值）：主轴为水平方向，起点在左端
2. row-reverse：主轴在水平方向，起点在右端
3. column，主轴在垂直方向，起点在上沿
4. column-reverse，主轴在垂直方向，起点在下沿


### flex-wrap，默认情况下，项目都排在一条线上，该属性定义，如果一条轴线排不下，如何换行

3个值：
nowrap（默认），不换行
wrap，换行，第一行在上方
wrap-reverse，换行，第一行在下方

### flex-flow，

flex-direction与flex-wrap的简写。

### justify-content，定义了项目在主轴上的对齐方式

5个值：
1. flex-start，左对齐
2. flex-end，右对齐
3. center，居中
4. space-between，两端对齐，项目之间的间隔相等
5. space-around，每个项目两侧的间隔相等


### align-itmes，定义项目在交叉轴上如何对齐

### align-content，定义了多根轴线的对齐方式

## 项目属性

### order，定义项目的排列顺序，数组越小，排列越靠前，默认为0

### flex-grow，定义项目的放大比例，默认为0

### flex-shrink，定义项目的缩小比例

### flex-basis，定义了在分配多余空间之前，项目占据的主轴空间

### flex

### align-self


注意：
1. 设为flex布局后，子元素的float，clear，vertical-align失效



