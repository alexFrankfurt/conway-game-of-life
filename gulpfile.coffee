gulp   = require "gulp"

coffeescript = require "gulp-coffeescript"
stylus       = require "gulp-stylus"

concat = require "gulp-concat"
gutil  = require "gulp-util"

paths =
  stylus: "./public/style/**/*.styl"
  coffee: "./public/script/**/*.coffee"
  html:   "./public/**/*.html"

distFolder = "./dist"

gulp.task "watch", ->
  gulp.watch paths.stylus, ["stylus"]
  gulp.watch paths.coffee, ["coffee"]
  gulp.watch paths.html,   ["html"]

gulp.task "coffee", ->
  gulp.src paths.coffee
    .pipe coffeescript bare: true
      .on "error", ->
        gutil.log
        this.end()
    .pipe gulp.dest distFolder + "/scripts"

gulp.task "stylus", ->
  gulp.src paths.stylus
    .pipe stylus()
    .pipe gulp.dest distFolder + "/css"

gulp.task "html", ->
  gulp.src paths.html
    .pipe gulp.dest distFolder
