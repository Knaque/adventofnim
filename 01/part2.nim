import strutils

var data: seq[int]

for line in lines("input.txt"):
  data.add(line.parseInt())

for x in data:
  for y in data:
    for z in data:
      if x + y + z == 2020:
        echo x * y * z
        quit()