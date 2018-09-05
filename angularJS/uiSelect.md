#### ui-select

经常访问ui-select demo页面时，经常打不开，所以把常用代码保留一份，方便查看

ui-select下拉框中进行多选
```
<div class="form-group">   
  <label class="col-sm-3 control-label">资源集群</label>   
  <div class="col-sm-7 ">     
   <ui-select multiple ng-model="multipleDemo.positions"  theme="bootstrap"   ng-disabled="disabled">       
	<ui-select-match placeholder="-- 请选择资源集群 --">{{$item.position_name}}</ui-select-match>       
	<ui-select-choices repeat="position in positions |  propsFilter: { position_name: $select.search, positionId: $select.search}">       
	<div ng-if="position.isTag" ng-bind-html="(position.position_name | highlight: $select.search) +' (新建资源集群)'"></div> 
	<div ng-if="!position.isTag" ng-bind-html="position.position_name | highlight: $select.search"></div>       
	</ui-select-choices>     
   </ui-select>   
  </div> 
</div>

$scope.multipleDemo = {}; 
$scope.positions = [   
	{ positionId: 456, position_name: '高计算集群' },   
	{ positionId: 457, position_name: '高内存集群' },   
	{ positionId: 458, position_name: '高安全集群' },   
	{ positionId: 459, position_name: '高性能集群' }]; 
$scope.multipleDemo.positions = [$scope.positions[0], $scope.positions[1]];
```