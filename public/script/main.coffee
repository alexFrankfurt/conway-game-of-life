
startButton = document.querySelector("#run")


arr = genArr()



canvas = document.querySelector("#canvas")
canvasLeft = canvas.offsetLeft
canvasTop = canvas.offsetTop
ctx = canvas.getContext "2d"
canvas.onclick = (e) ->
  x = e.pageX - canvasLeft
  y = e.pageY - canvasTop
  j = Math.floor x / 5
  i = Math.floor y / 5
  arr[i][j] = 1
  drawGrid arr



# arr 2 1 to 1
arr[1][1] = 1
arr[2][1] = 1
arr[3][1] = 1

drawGrid = (arr) ->
  console.log arr
  width = CS * N
  height = CS * M
  ctx.fillStyle = BC
  ctx.fillRect 0, 0, width, height
  ((
    ctx.strokeStyle = GC
    ctx.strokeRect col * CS, row * CS, CS, CS
  ) for row in [0..M - 1]) for col in [0..N - 1]
  ctx.fillStyle = "lime"
  ((
    if arr[row][col] == 1
      ctx.fillRect col * CS, row * CS, CS, CS
  ) for row in [0..M - 1]) for col in [0..N - 1]


draw = (arr, num) ->
  drawGrid arr
  ctx.fillStyle = "lime"
  ((
    if arr[row][col] == 1
      ctx.fillRect col * CS, row * CS, CS, CS
  ) for row in [0..M - 1]) for col in [0..N - 1]
  await new Promise((r) -> setTimeout(r, 500))
  console.log "one step"
  if num < 0
    0
  else
    draw nextGen(arr), num -= 1


drawGrid arr

startButton.onclick = () ->
  draw(arr, 10)
