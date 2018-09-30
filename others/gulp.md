#### Gulp

Gulp基于Node.js的前端构建工具，通过Gulp的插件可以实现前端代码的编译（sass、less）、压缩、测试；图片的压缩；浏览器自动刷新等。

gulp只有五个方法： task，run，watch，src，和dest

`.task` //定义任务

`.watch` //监听，方法去监听指定目录的文件变化

`.run` //运行定义的任务

`.src` //文件路径

`.dest` //编译后的最终文件指向



```
// 引入 gulp
var gulp = require('gulp'); 

// 引入组件
var jshint = require('gulp-jshint');
var sass = require('gulp-sass');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');

// 检查脚本
gulp.task('lint', function() {
    gulp.src('./js/*.js')
        .pipe(jshint())
        .pipe(jshint.reporter('default'));
});

// 编译Sass
gulp.task('sass', function() {
    gulp.src('./scss/*.scss')
        .pipe(sass())
        .pipe(gulp.dest('./css')); //Sass任务会编译scss/目录下的scss文件，并把编译完成的css文件保存到/css目录中
});

// 合并，压缩文件
gulp.task('scripts', function() {
    gulp.src('./js/*.js')
        .pipe(concat('all.js'))
        .pipe(gulp.dest('./dist'))
        .pipe(rename('all.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('./dist'));
});

// 默认任务
gulp.task('default', function(){
    gulp.run('lint', 'sass', 'scripts');

    // 监听文件变化
    gulp.watch('./js/*.js', function(){
        gulp.run('lint', 'sass', 'scripts');
    });
});
```