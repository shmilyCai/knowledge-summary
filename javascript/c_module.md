# js模拟实现es6的module

module为ES6的功能，包含 import 和export

```
var tester = (function testFn (){

	function alertName (){};

	return {
		name:alertName
	}
})();

```