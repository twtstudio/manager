var gulp = require('gulp');
var less = require('gulp-less');
var coffee = require('gulp-coffee');
var uglify = require('gulp-uglify');
var path = require('path');
var jade = require('gulp-jade')

lessPath = './public/app/style';
coffeePath = './public/app/script';
jadePath = './public/app/views'

gulp.task('less', function() {
  return gulp.src(lessPath + "/*.less").pipe(less()).pipe(gulp.dest(lessPath));
});

gulp.task('coffee', function() {
  return gulp.src(coffeePath + "/**/*.coffee").pipe(coffee()).on('error', function(error) {
    throw error;
  }).pipe(uglify().pipe(gulp.dest(coffeePath)));
});

gulp.task('jade', function() {
  return gulp.src(jadePath + "/*.jade").pipe(jade()).pipe(gulp.dest(jadePath));
});

gulp.task('default', ['less', 'coffee', 'jade'], function() {
  gulp.watch(lessPath + "/*.less", function() {
    return gulp.run('less');
  });
  gulp.watch(jadePath + "/*.jade", function(){
    return gulp.run('jade');
  });
  return gulp.watch(coffeePath + "/**/*.coffee", function() {
    return gulp.run('coffee');
  });
});
