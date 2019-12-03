import strutils, sequtils, strformat, sugar

proc parseInput*(data: string): seq[int] =
    data.split(",").map(x => x.parseInt())

proc add*(elementOnePos: int, elementTwoPos: int, opcodes: seq[int]): int =
    return opcodes[elementOnePos] + opcodes[elementTwoPos]

proc multiply*(elementOnePos: int, elementTwoPos: int, opcodes: seq[int]): int =
    return opcodes[elementOnePos] * opcodes[elementTwoPos]

proc execute(opcodes: var seq[int]) =
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

when defined(test):
    proc testExecution(input: string, output: string) =
        var opcodes = input.parseInput()
        execute(opcodes)
        echo(opcodes)
        doAssert opcodes.join(",") == output
    
    testExecution("1,0,0,0,99", "2,0,0,0,99")
    testExecution("2,3,0,3,99", "2,3,0,6,99")
    testExecution("2,4,4,5,99,0", "2,4,4,5,99,9801")
    testExecution("1,1,1,4,99,5,6,0,99", "30,1,1,4,2,5,6,0,99")

when isMainModule:
    let fileData = readFile("input.txt")
    var opcodes = fileData.parseInput()
    opcodes[1] = 12
    opcodes[2] = 2
    execute(opcodes)
    echo fmt"Answer is {opcodes[0].intToStr()}"
