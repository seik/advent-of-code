import math
import strformat
import strutils

var
    totalFuel = 0

let file = open("input.txt")

proc calculateFuel(mass: int, totalFuel: int = 0): int =
    let fuel = floor(mass / 3).int - 2
    if fuel < 0:
        return totalFuel
    else:
        return calculateFuel(fuel, totalFuel + fuel)

for line in lines(file):
    totalFuel.inc calculateFuel(line.parseInt())

echo fmt"The total fuel required is: {totalFuel}"
