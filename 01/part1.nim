import strutils

var data: seq[int]

for line in lines("input.txt"):
  data.add(line.parseInt())

for x in data:
  for y in data:
    if x + y == 2020:
      echo x * y
      quit()