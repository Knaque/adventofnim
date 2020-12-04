import strutils, sequtils

let data = toSeq(lines("input.txt")).map(parseInt)

for x in data:
  for y in data:
    for z in data:
      if x + y + z == 2020:
        echo x * y * z
        quit()