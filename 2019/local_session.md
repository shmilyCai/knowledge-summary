# localStorage，sessionStorage与cookie区别

## localStorage

本地存储，存储在浏览器中，当用户清除缓存时才可消除

## sessionStorage

会话存储，当前会话存储，当用户关闭系统页面时，会话消失

## cookie

存储容量少，作为http规范的一部分，每次都随着请求被发送出来


## localStorage与sessionStorage方法

以下以localStorage为例

```
localStorage.getItem(key)://获取指定key本地存储的值
localStorage.setItem(key,value)：//将value存储到key字段
localStorage.removeItem(key)://删除指定key本地存储的值
localStorage.valueOf();//获取全部数据
localStorage.key(N)；//获取指定下标key键值
localStorage.clear();// 清空缓存数据
```