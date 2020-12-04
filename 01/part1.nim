import strutils, sequtils

let data = toSeq(lines("input.txt")).map(parseInt)

for x in data:
  for y in data:
    if x + y == 2020:
      echo x * y
      quit()