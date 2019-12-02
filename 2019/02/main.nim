import strutils
import sequtils
import strformat

proc add(elementOnePos: int, elementTwoPos: int, opcodes: seq[int]): int =
    return opcodes[elementOnePos] + opcodes[elementTwoPos]

proc multiply(elementOnePos: int, elementTwoPos: int, opcodes: seq[int]): int =
    return opcodes[elementOnePos] * opcodes[elementTwoPos]

let file = open("input.txt")

var opcodes = readAll(file).split(",").mapIt(parseInt(it))

for position in countup(0, opcodes.len, 4):
    let instruction = opcodes[position]
    if instruction == 99:
        break
    else:
        let
            elementOnePos = opcodes[position + 1]
            elementTwoPos = opcodes[position + 2]
            storePos = opcodes[position + 3]
        case instruction:
            of 1:
                opcodes[storePos] = add(elementOnePos, elementTwoPos, opcodes)
            of 2:
                opcodes[storePos] = multiply(elementOnePos, elementTwoPos, opcodes)
            else:
                discard

echo fmt"Answer is {opcodes[0].intToStr()}"