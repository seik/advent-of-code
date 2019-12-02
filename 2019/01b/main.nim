import math
import strformat
import parseutils


var
    totalFuel = 0
    line = ""
    mass: int

let file = open("input.txt")

proc calculateFuel(mass: int, totalFuel: int = 0): int =
    let fuel = int(floor(mass / 3) - 2)
    if fuel < 0:
        return totalFuel
    else:
        return calculateFuel(fuel, totalFuel + fuel)

while file.readLine(line):
    discard parseInt(line, mass)
    totalFuel += calculateFuel(mass)

echo fmt"The total fuel required is: {totalFuel}"
