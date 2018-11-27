#### table-layout设置fixed后，设置td宽度无效的解决方法

table表格中最后一行的按钮显示不完整，需要完整显示最后一行的按钮，方便用户操作

##### 产生原因

table表格使用了`table-layout:fixed`属性，该属性设置后table中的td为为自动等分宽度



```
table{
	table-layout:fixed; //自动等分宽度，可设置第一列的宽度，后面列的宽度设置则无效

	table-layout:auto;  //表格布局的默认行为，表格及单元格的宽度取决于其包含的内容，不可控性大
}
```

#####  解决方案

```
<table>
	<col style="width:100px"/>
	<col style="width:200px"/>
	<col style="width:300px"/> //col的个数与td的个数一致
	<tbody>
	<tr>
		<td colspan="3">统计表</td>
	</tr>
	<tr>
		<td>111</td>
		<td>222</td>
		<td>333</td>
	</tr>
</table>
```