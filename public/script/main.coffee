App = window.App

select = App.select

canvas = select("#canvas")



M = 10

N = 10

CS = 5

CC = "#388338"


genArr = ->
  arr = []
  hel = ->
    a = []
    a.push 0 for num in [0..N - 1]
    a
  arr.push hel() for num in [0..M - 1]
  arr


# Given array and position and live status look for 8 neighbours
# and if 1) > 3 of them are alive, then die
#        2) < 2 of them are alive, then die
#        3) 2 or 3 of them alive, this alive, then live
#        4) 3 of them alive, this dead, then become alive.
# Borders are dead.
changeLife = (arr, x, y, status) ->
  aliveNeighboursNumber = ->
    num = 0
    if arr[x - 1] != undefined and arr[x - 1][y - 1] == 1
      num += 1
    if arr[x][y - 1] == 1
      num += 1
    if arr[x + 1] != undefined and arr[x + 1][y - 1] == 1
      num += 1
    if arr[x - 1] != undefined and arr[x - 1][y] == 1
      num += 1
    if arr[x + 1] != undefined and arr[x + 1][y] == 1
      num += 1
    if arr[x - 1] != undefined and arr[x - 1][y + 1] == 1
      num += 1
    if arr[x][y + 1] == 1
      num += 1
    if arr[x + 1] != undefined and arr[x + 1][y + 1] == 1
      num += 1
    num

  ann = aliveNeighboursNumber()
  if ann > 1
    console.log "pos: " + x + " : " + y
    console.log ann

  if ann > 3
    0
  else if ann < 2
    0
  else if status == 1
    1
  else if ann == 3 and status == 0
    1
  else
    0

nextGen = (arr) ->
  newArr = genArr()
  ((
    status = arr[i][j]
    newArr[i][j] = changeLife arr, i, j, status
  ) for i in [0..M - 1]) for j in [0..N - 1]
  newArr

arr = genArr()

# arr 2 1 to 1
arr[1][1] = 1
arr[2][1] = 1
arr[3][1] = 1
console.log arr + 1

draw = (arr, num) ->
  ctx = canvas.getContext "2d"
  width = CS * N
  height = CS * M
  ctx.fillStyle = CC
  ctx.fillRect 0, 0, width, height

  ((
    if arr[row][col] == 1
      ctx.fillStyle = "lime"
      ctx.fillRect col * CS, row * CS, CS, CS
  ) for row in [0..M - 1]) for col in [0..N - 1]
  await new Promise((r) -> setTimeout(r, 500))
  console.log "one step"
  if num < 0
    0
  else
    draw nextGen(arr), num -= 1




draw(arr, 10)


console.log arr + 1
