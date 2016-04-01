App = window.App

select = App.select #(s) -> document.querySelector s

canvas = select("#canvas")

M = 10

N = 10

arr = []

hel = ->
  a = []
  a.push 0 for num in [0..N]
  a

arr.push hel() for num in [0..M]

arr[3][5] = 1

console.log arr

draw = ->
  ctx = canvas.getContext "2d"
  width = 5 * N
  height = width * M
  ctx.fillStyle = "white"
  ctx.fillRect 0, 0, width, height
  ((
    if arr[row][col] == 1
      ctx.fillStyle = "lime"
      ctx.fillRect col * 5, row * 5, 5, 5
  ) for row in [1..M]) for col in [1..N]

nextBoundPoint = (i, B) ->
  if i + 1 == B
    0
  else
    i + 1

prevBoundPoint = (i, B) ->
  if i - 1 == 0
    0
  else



newGeneration = ->
  i = row
  j = col




  arr[i]





  if sum < 2 || sum > 3
    blah

draw()
