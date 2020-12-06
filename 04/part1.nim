import strutils, tables

var data: seq[string] # I don't know why .split("\n\n") doesnt work...

block SplitByPassport:
  var buf: string
  for line in lines("input.txt"):
    if line != "": buf.add(" " & line)
    else: data.add(buf.strip()); buf = ""

var total = 0
for id in data:
  var fields: Table[string, string]
  for field in id.split():
    let x = field.split(':')
    fields[x[0]] = x[1]
  if (
    fields.hasKey("byr") and
    fields.hasKey("iyr") and
    fields.hasKey("eyr") and
    fields.hasKey("hgt") and
    fields.hasKey("hcl") and
    fields.hasKey("ecl") and
    fields.hasKey("pid")
  ):
    total += 1
echo total