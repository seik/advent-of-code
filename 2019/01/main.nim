import math
import strformat
import strutils

var
    totalFuel = 0

let file = open("input.txt")

for line in lines(file):
    totalFuel.inc floor(line.parseInt() / 3).int - 2

echo fmt"The total fuel required is: {totalFuel}"
