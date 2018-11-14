#### 详解目前项目中的打包文件

今天接收到一个任务：

由于产品中的js文件过大，首页加载时间过长，用户体验较差，对现有产品js文件进行压缩，减少文件大小，提高加载速度。

##### gulp文件分析

项目中使用的是Yeoman Generator插件： [https://github.com/Swiip/generator-gulp-angular](https://github.com/Swiip/generator-gulp-angular)

打包文件的入口点是根目录下的`gulpfile.js`

其余的代码在根目录下的gulp文件夹下，gulp文件下的各个js的功能说明

```
build.js  //打包时的文件
config.js  //配置文件，对应的是constants.json中的dev和pro
inject.js  //将各个js，css，html文件注入相应的文件下
install.js  //通过检查bower.json注入依赖文件
proxy.js  //代理
script.js  //js代码合并
server.js  //gulp server运行的任务
styles.js  //合并和解析sass文件
watch.js  //html，js，css文件监听，实时更新

```

##### <font color="#dd0000">index.html </font>

index.html文件中是通过wiredep插件的注释功能自动来注入产品和bower.json中插件的js和css。

```
注入css文件
  <!-- build:css({.tmp/serve,src}) styles/vendor.css -->
  <!-- bower:css -->
  <!-- run `gulp inject` to automatically populate bower styles dependencies -->
  <!-- endbower -->
  <!-- endbuild -->

  <!-- build:css({.tmp/serve,src}) styles/app.css -->
  <!-- inject:css -->
  <!-- css files will be automatically insert here -->
  <!-- endinject -->
  <!-- endbuild -->

注入js文件
<!-- build:js(src) scripts/vendor.js -->
<!-- bower:js -->
<!-- run `gulp inject` to automatically populate bower script dependencies -->
<!-- endbower -->
<!-- endbuild -->

<!-- build:js({.tmp/serve,.tmp/partials,src}) scripts/app.js -->
<!-- inject:js -->
<!-- js files will be automatically insert here -->
<!-- endinject -->

<!-- inject:partials -->
<!-- angular templates will be automatically converted in js and inserted here -->
<!-- endinject -->
<!-- endbuild -->
```

##### <font color="#dd0000">inject.js代码分析</font>

大致说明下

```
'use strict';

var gulp = require('gulp');

//引入gulp-load-plugins，这个插件可NB了，可以自动加载所有的devDependencies插件，这样就不需要在文件开头写一堆require引入了。
var $ = require('gulp-load-plugins')();   

var wiredep = require('wiredep').stream;

module.exports = function(options) {

//在文件中寻找特定的tag，将指定的文件插入到目标文件中，css插入css文件，js插入js文件，html插入html文件
  gulp.task('inject', ['scripts', 'styles'], function () {
    var injectStyles = gulp.src([
      options.tmp + '/serve/app/**/*.css',
      '!' + options.tmp + '/serve/app/vendor.css'
    ], { read: false });

    var injectScripts = gulp.src([
      options.src + '/app/**/*.js',
      '!' + options.src + '/app/**/*.spec.js',
      '!' + options.src + '/app/**/*.mock.js'
    ])
      .pipe($.angularFilesort()).on('error', options.errorHandler('AngularFilesort'));  //调整angularjs中各个模块的依赖顺序

//注入后的index.html被放置在.tmp/serve
    var injectOptions = {
      ignorePath: [options.src, options.tmp + '/serve'],
      addRootSlash: false
    };

    return gulp.src(options.src + '/*.html')
      .pipe($.inject(injectStyles, injectOptions))
      .pipe($.inject(injectScripts, injectOptions))
      .pipe(wiredep(options.wiredep))
      .pipe(gulp.dest(options.tmp + '/serve'));

  });
};
```

##### <font color="#dd0000">build.js代码分析</font>

解决上述任务的重要文件了

```
'use strict';

var gulp = require('gulp'),
  gulpSequence = require('gulp-sequence');

var $ = require('gulp-load-plugins')({
  pattern: ['gulp-*', 'main-bower-files', 'uglify-save-license', 'del']
});

module.exports = function(options) {

//将所有的angularjs的template合并，通过angularTemplatecache服务将原本的html载入，减少请求数
  gulp.task('partials', function () {
    return gulp.src([
      options.src + '/app/**/*.html',
      options.tmp + '/serve/app/**/*.html'
    ])
      .pipe($.minifyHtml({
        empty: true,
        spare: true,
        quotes: true
      }))
      .pipe($.angularTemplatecache('templateCacheHtml.js', {
        module: 'fast-westone',
        root: 'app'
      }))
      .pipe(gulp.dest(options.tmp + '/partials/'));
  });

//打包流程，包括注入资源的合并，html/css/js压缩，版本号自动添加，angular依赖注入等
  gulp.task('html', ['inject', 'partials'], function () {
    var partialsInjectFile = gulp.src(options.tmp + '/partials/templateCacheHtml.js', { read: false });
    var partialsInjectOptions = {
      starttag: '<!-- inject:partials -->',
      ignorePath: options.tmp + '/partials',
      addRootSlash: false
    };

    var htmlFilter = $.filter('*.html');
    var jsFilter = $.filter('**/*.js');
    var jsFilterApp = $.filter('**/app-*.js');  //过滤出pkg产品的js文件
    var cssFilter = $.filter('**/*.css');
    var assets;

    return gulp.src(options.tmp + '/serve/*.html')
      .pipe($.inject(partialsInjectFile, partialsInjectOptions))
      .pipe(assets = $.useref.assets())
      .pipe($.rev())
      .pipe(jsFilter)
      .pipe($.ngAnnotate())
      .pipe(jsFilter.restore())
      //pkg产品中的app.js压缩-start
      .pipe(jsFilterApp)
      .pipe($.uglify({ preserveComments: $.uglifySaveLicense,compress:false, mangle:false})).on('error', options.errorHandler('Uglify'))
      .pipe(jsFilterApp.restore())
      //pkg产品中的app.js压缩-end
      .pipe(cssFilter)
      .pipe($.replace('../../bower_components/bootstrap-sass-official/assets/fonts/bootstrap/', '../fonts/'))
      .pipe($.csso())
      .pipe(cssFilter.restore())
      .pipe(assets.restore())
      .pipe($.useref())
      .pipe($.revReplace())
      .pipe(htmlFilter)
      .pipe($.minifyHtml({
        empty: true,
        spare: true,
        quotes: true,
        conditionals: true
      }))
      .pipe(htmlFilter.restore())
      .pipe(gulp.dest(options.dist + '/'))
      .pipe($.size({ title: options.dist + '/', showFiles: true }));
  });

  // 载入字体文件
  gulp.task('fonts', function () {
    return gulp.src($.mainBowerFiles())
      .pipe($.filter('**/*.{eot,svg,ttf,woff,woff2}'))
      .pipe($.flatten())
      .pipe(gulp.dest(options.dist + '/fonts/'));
  });

  gulp.task('vendor', function () {
    return gulp.src([
      options.src + '/vendor/**/*'
    ])
      .pipe(gulp.dest(options.dist + '/vendor/'));
  });
  
  
  gulp.task('dataview', function () {
    return gulp.src([
      options.src + '/tpl/dataView/*'
    ])
      .pipe(gulp.dest(options.dist + '/tpl/dataView/'));
  });
  
  //除开html,css,js,scss后的，其他文件载入
  gulp.task('other', function () {
    return gulp.src([
      options.src + '/**/*',
      '!' + options.src + '/**/*.{html,css,js,scss}'
    ])
      .pipe(gulp.dest(options.dist + '/'));
  });
  
  //删除临时文件
  gulp.task('clean', function (done) {
    $.del.sync([options.dist + '/', options.tmp + '/', options.src + '/app/constants.js', options.src + '/app/apiEndpoint.js'], done());
  });

//打包任务
  gulp.task('build', ['config:pro', 'config:urlPro','html', 'fonts', 'vendor','dataview', 'other']);
  gulp.task('rebuild',gulpSequence('clean', 'build'));

  gulp.task('gen:dev', ['config:dev', 'config:urlDev','html', 'fonts', 'vendor','dataview', 'other']);
  gulp.task('gen:production', ['config:pro', 'config:urlPro','html', 'fonts', 'vendor','dataview', 'other']);

  gulp.task('build:noapi',['config:pro','html', 'fonts', 'vendor','dataview', 'other']);

  gulp.task('build:dev', ['clean'], function() {
    gulp.start('gen:dev');
  });
  gulp.task('build:production', ['clean'], function() {
    gulp.start('gen:production');
  });
  gulp.task('build:test', ['clean'], function() {
    gulp.start('gen:test');
  });
  gulp.task('buildTest', ['clean'], function() {
    gulp.start('gen:test');
  });

};


```



