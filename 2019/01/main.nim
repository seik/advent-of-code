import math
import strformat
import parseutils


var
    totalFuel = 0
    line = ""
    mass: int

let file = open("input.txt")

while file.readLine(line):
    discard parseInt(line, mass)
    totalFuel += int(floor(mass / 3) - 2)

echo fmt"The total fuel required is: {totalFuel}"
