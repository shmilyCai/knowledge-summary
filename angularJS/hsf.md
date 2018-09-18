#### $http，$resource

$http与$resource
本质上功能都是一样的，都是基于XMLHttpRequest和服务器交互的服务

不同的是`resource`是对`$http`更高层次的抽象，`$resource`依赖于`$http`，也就是说`$resource`是在$http的基础上开发的

`$http`通常用于和RESTful server-side交互，要求接口RESTful话，`'$resource(url)'`返回的不`Promise`，也是一个资源对象，你可以对一个资源对象进行`get、query、save、delete`等操作

##### $http

angular内置的$http服务可以直接同外部通信，$http服务只是简单的封装了浏览器原生的XMLHttpRequest对象

请求方式：

```
//$http
 .factory('nbService', ['$http', 'API_ENDPOINT', function($http, API_ENDPOINT){
    return {
      get: function(params){
        return $http({
          url:API_ENDPOINT + '',
          method:'GET',
          params: params
        });
      },
    };
  }]);
nbService.get({}).then(function (resp) {}).then(function(){});

```

##### $resource
（可以自动获得get、save、query、remove和delete方法）

$resource(资源)允许我们用描述性的方式来定义对象模型，它可以描述： 资源在服务端的URL
请求方式：

```
 //$resource
 .factory('configService', function($resource, API_APPLICATION) {
    return $resource(API_APPLICATION + '/api/v1/tenants/:tenantId/namespaces/:namespace/config-groups/:oid', {
      tenantId:'@tenantId',
      oid:'@oid',
      namespace: "@namespace"
    },{
      query:{
        isArray: false
      },
      update: {
        url: "",
        method: 'POST'
      },
      delete: {
        url: ""
        method: 'POST'
      }
    });
  })
configService.query(paramsObj).$promise.then(function(resp){}).then(function(){});

```