import strutils

let data = readFile("input.txt").splitLines()

proc trees(x, y: int): int =
  var xpos = 0
  for ypos, line in data:
    if ypos mod y != 0: continue
    if line[xpos mod line.len] == '#':
      result += 1
    xpos += x

echo trees(1, 1) * trees(3, 1) * trees(5, 1) * trees(7, 1) * trees(1, 2)