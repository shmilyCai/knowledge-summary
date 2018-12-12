# 排序

```
var arr = [3, 6, 8, 2, 4, 10, 67 , 5];
```

## 插入排序
```
var sort = function(arr){
	var len = arr.length;
	for(var i = 1; i < len; i++){ //循环数组，从第二个开始
		var element = arr[i]; //临时保存一份后面的一个值
		for(var j = i - 1; j >= 0; j--){ //从第一个值开始
			var tmp = arr[j]; //临时保存一份值，为第二个值
			var order = tmp - element; //比较2个值的大小
			if(order > 0){  
				arr[j + 1] = tmp; //如果第二个大，将大的值放在后面，
			}else{  
				break;  //如果第一个值小，退出循环
			}
		}
		arr[j + 1] = element; //将大的值赋予第二个
	}

	return arr;
};
var arrs = [3, 6, 8, 2, 4, 10, 67 , 5];
console.log(sort(arrs));
```

## 快速排序

```
var sort = function(arr){
	if(arr.length <= 1){  //当arr为1时，返回arr
		return arr;
	}
	var index = Math.floor(arr.length/2);  //找到中间最大值的下标
	var indexNum = arr.splice(index, 1);  //根据下标找到中间的值, splice会修改原数组，index为索引，1位个数

	var left = [];
	var right = [];

	for(var i = 0; i < arr.length; i++){
		if(arr[i] < indexNum){
			left.push(arr[i]);
		}else{
			right.push(arr[i]);
		}
	}

	return sort(left).concat(indexNum, sort(right));  //链接左边，中间和右边的数组
}

var arrs = [3, 6, 8, 2, 4, 10, 67 , 5];
console.log(sort(arrs));
```

## 冒泡排序

```
var swap = function(myArr, p1, p2){  //数组中的元素，交换位置
	var temp = myArr[p1];  //temp为临时存放的数值
	myArr[p1] = myArr[p2];
	myArr[p2] = temp;

}

var sort = function(arr){
	var i, j, len;
	len = arr.length;

	for(i = 0; i < len; i++){  //循环arr数组
		for(j = 0; j < len - 1 - i; j++){  //j时小于数组的
			if(arr[j] > arr[j + 1]){   //找出大的值，交换位置，for完后最大在最后面
				swap(arr, j, j+1);
			}
		}
	}
	return arr;
}

var arrs = [3, 6, 8, 2, 4, 10, 67 , 5];
console.log(sort(arrs));
```

## 选中排序









