var total = 0
var xpos = 0
for line in lines("input.txt"):
  if line[xpos mod line.len] == '#':
    total += 1
  xpos += 3
echo total