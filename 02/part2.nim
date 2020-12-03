import strutils

var total = 0
for line in lines("input.txt"):
  let
    buf = line.split()
    (a, b) = (buf[0].split('-')[0].parseInt, buf[0].split('-')[1].parseInt)
    c = buf[1][0]
    str = buf[2]
  if (str[a-1] == c and str[b-1] != c) or (str[a-1] != c and str[b-1] == c):
    total += 1
echo total