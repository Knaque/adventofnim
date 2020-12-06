import sequtils

var taken: seq[tuple[row: int, column: int]]
var ids: seq[int]
for line in lines("input.txt"):
  var
    row: int
    column: int
    rp = toSeq(0..127)
    cp = toSeq(0..7)
  for c in line:
    if c == 'B': rp = rp[(rp.len/2).toInt()..^1]
    if c == 'F': rp = rp[0..(rp.len/2-1).toInt()]
    if c == 'R': cp = cp[(cp.len/2).toInt()..^1]
    if c == 'L': cp = cp[0..(cp.len/2-1).toInt()]
  row = rp[0]
  column = cp[0]
  ids.add(row * 8 + column)
  taken.add((row, column))

for row in 0..127:
  for column in 0..7:
    if (row, column) notin taken and
      (row * 8 + column) + 1 in ids and
      (row * 8 + column) - 1 in ids:
      echo row * 8 + column