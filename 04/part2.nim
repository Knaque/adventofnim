import strutils, tables, re

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
    fields.hasKey("pid") and
    fields["byr"].parseInt() in 1920..2002 and
    fields["iyr"].parseInt() in 2010..2020 and
    fields["eyr"].parseInt() in 2020..2030 and
    fields["hgt"].match(re"\d+(cm|in)") and
    (
      (
        fields["hgt"].endsWith("cm") and fields["hgt"][0..^3].parseInt() in 150..193
      ) or
      (
        fields["hgt"].endsWith("in") and fields["hgt"][0..^3].parseInt() in 59..76
      )
    ) and
    fields["hcl"].match(re"#[0-9a-fA-F]{6}") and
    fields["ecl"] in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"] and
    fields["pid"].len == 9 and fields["pid"].match(re"0*[1-9]*")
  ):
    total += 1
echo total