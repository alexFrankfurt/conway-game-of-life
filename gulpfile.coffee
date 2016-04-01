gulp   = require "gulp"

coffee = require "gulp-coffee"
stylus = require "gulp-stylus"
jade   = require "gulp-jade"

concat = require "gulp-concat"
gutil  = require "gulp-util"

paths =
  stylus: "./public/style/**/*.styl"
  coffee: "./public/script/**/*.coffee"
  jade:   "./public/**/*.jade"

gulp.task "watch", ->
  gulp.watch paths.stylus, ["stylus"]
  gulp.watch paths.coffee, ["coffee"]
  gulp.watch paths.jade,   ["jade"]

gulp.task "coffee", ->
  gulp.src paths.coffee
    .pipe coffee bare: true
      .on "error", ->
        gutil.log
        this.end()
    .pipe gulp.dest "./public/dist/js"

gulp.task "stylus", ->
  gulp.src paths.stylus
    .pipe stylus()
    .pipe gulp.dest "./public/dist/css"

gulp.task "jade", ->
  gulp.src paths.jade
    .pipe jade
      pretty: true
    .pipe gulp.dest "./public/dist"

gulp.task "hello", ->
  console.log "Hello from gulp coffee"
