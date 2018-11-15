#### angularJs的$q

$q服务是angularJS中自己封装实现的一种Promise实现。

#####  promise的三种状态：

等待状态

完成状态

拒绝状态


##### $q的常用方法

```
defer()  //创建一个deferred对象，这个对象执行几个常用的方法，如resolve，reject，notify等

all()   //传入promise的数组，批量执行，返回一个promise

when()   //传入一个不确定的参数，如果符合promise标准，就返回一个promise对象

```

##### defer() 

```
   var defer1 = $q.defer();
            var promise1 = defer1.promise;

            promise1
            .then(function(value){
                console.log("in promise1 ---- success");
                console.log(value);
            },function(value){
                console.log("in promise1 ---- error");
                console.log(value);
            },function(value){
                console.log("in promise1 ---- notify");
                console.log(value);
            })
            .catch(function(e){
                console.log("in promise1 ---- catch");
                console.log(e);
            })
            .finally(function(value){
                console.log('in promise1 ---- finally');
                console.log(value);
            });

            defer1.resolve("hello");
            // defer1.reject("sorry,reject");
```

##### all()

```
  var funcA = function(){
                console.log("funcA");
                return "hello,funA";
            }
            var funcB = function(){
                console.log("funcB");
                return "hello,funB";
            }
            $q.all([funcA(),funcB()])
            .then(function(result){
                console.log(result);
            });
```

##### when()

```
   var funcA = function(){
                console.log("funcA");
                return "hello,funA";
            }
            $q.when(funcA())
            .then(function(result){
                console.log(result);
            });
```














