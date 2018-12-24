# 路由

根据路由的层级分为：平级路由和路由树

写法：

```
import { LayoutComponent } from './layout.component';

export const routes: Routes = [
  {
    path: '',
    component: LayoutComponent,
    children: [
      { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
      {
        path: 'dashboard',
        loadChildren: 'src/app/dashboard/dashboard.module#DashboardModule'
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

```

## 特点

1. 支持2种预加载策略：完全不预加载和预加载所有惰性加载的特征区域
2. 路由器还支持自定义预先加载策略


## 路由守卫

应用在这个路由不是对所有导航都有效的，是有一些前置条件的，只有当前置条件满足时，才能被导航到该页面。

1. CanActivate， 处理导航到某条路由的情况

	需要在路由中添加导入AuthGuard类

	```
	const adminRoutes: Routes = [
	  {
	    path: 'admin',
	    component: AdminComponent,
	    canActivate: [AuthGuard], // 重点
	    children: [
	      {
	        path: '',
	        children: [
	          { path: 'crises', component: ManageCrisesComponent },
	          { path: 'heroes', component: ManageHeroesComponent },
	          { path: '', component: AdminDashboardComponent }
	        ],
	      }
	    ]
	  }
	];
	```

2. CanActivateChild，处理导航到子路由的情况

3. CanDeactivate，处理从当前路由离开的情况

4. Resolve，路由激活之前获取路由数据，实现导航预先加载路由信息

5. CanLoad，处理异步导航到某特性模块的情况

	异步路由，懒惰加载

	优点：
	1. 可以继续构建特征区，但不再增加初始包大小
	2. 只有在用户请求时才加载特征区
	3. 为那些只访问应用程序某些区域的用户加快加载速度



## 无组件路由

	没有使用component的称为无组件路由，不借助组件对路由进行分组

## 路由参数写法

```
<a [routerLink]="['/heroes']">Heroes</a>
```

```
this.router.navigate(['/hero', hero.id]);
```

```
<a [routerLink]="['/crisis-center', { foo: 'foo' }]">Crisis Center</a>
```


## 注意点

带`**`号的路由放在所有路由最下面，指前面的路由找不到其能匹配的路由时才匹配它




