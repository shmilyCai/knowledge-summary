#### proxy

在目标对象之前架设一层“拦截”，外界对该对象的访问，都必须先通过这层拦截，因此提供了一种机制，可以对外界的访问进行过滤和修改。

```
var proxy = new Proxy(target, handler);
```
proxy对象的所有用法，都是这种形式，不同的只是handler参数的写法。其中，`new Proxy（）`表示生成一个proxy实例，target参数表示所要拦截的目标对象，handler参数也是一个对象，用来定制拦截行为。




#### get()

get方法用于拦截某个属性的读取操作

#### set()

set方法用来拦截某个属性的赋值操作

#### apply()

apply方法拦截函数的调用，call和apply操作

#### has()

has方法用来拦截HasProperty操作，即判断对象是否具有某个属性时

#### construct()

construct方法用于拦截new命令

#### deleteProperty()

deleteProperty方法用于拦截delete操作





















