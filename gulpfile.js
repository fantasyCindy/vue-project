var gulp = require("gulp");
var autoprefix = require("gulp-autoprefixer");
var browserSync = require("browser-sync").create();
var sass = require("gulp-sass");
var reload = browserSync.reload;
var path = require("path");

const watchFolder = "./public/wap/";

/*///////////////////////////////////////////////////////////////////*/

gulp.task("serve", function() {
  browserSync.init({
    server: watchFolder
  });
  gulp.watch(watchFolder + "**/*.css").on("change", reload);
  gulp.watch(watchFolder + "**/*.html").on("change", reload);
  gulp.watch(watchFolder + "**/*.bundle.js").on("change", reload);
});

gulp.task("default", ["serve"]);
