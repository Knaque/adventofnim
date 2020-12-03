import strutils

var total = 0
for line in lines("input.txt"):
  let
    buf = line.split()
    (min, max) = (buf[0].split('-')[0].parseInt, buf[0].split('-')[1].parseInt)
    c = buf[1][0]
  var count: int
  for char in buf[2]:
    if char == c:
      count += 1
  if count in min..max:
    total += 1
echo total