//
//        \`--.
//         )  _`-.
//        .  : `. .        MEOW
//        : _   '  \       (ОПЯТЬ НАГАВНОКОДИЛ)
//        ; *` _.   `--._
//        `-.-'          `-.
//          ;       `       `.
//          :.       .        \
//          . \  .   :   .-'   .
//          '  `-.;  ;  '      :
//          :  '  |    ;       ;-.
//          ; '   : :`-:     _.`| ;
//  [bug] .-' /  .-' ; .-`- +'  `-'
//        `--*   `--* `---'
//

import Foundation

private var alphabet = ["a","b","c","d","e","f","g","h","j","k"]

private var solution9_1_5_NotEmpty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_5_NotEmpty.txt"), append: true)!

private func move(loop: String) -> String {
    if loop.count == 1 {
        return loop
    }
    
    return loop[1..<loop.count] + loop[0]
}

private func isMinLoop(loop: String) -> Bool {
    let first = loop[0]
    for j in 1..<loop.count {
        if loop[j] < first {
            return false
        }
    }
    return true
}

private func isNormalLoops(loops: [String]) -> Bool {
    for j in 0..<loops.count {
        if !isMinLoop(loop: loops[j]) {
            return false
        }
    }
    return true
}

private func isUsedChar(_ ch: String, in loops: [String]) -> Bool {
    for j in 0..<loops.count {
        if loops[j].contains(ch) {
            return true
        }
    }
    
    return false
}

private func index(_ of: String) -> Int {
    return alphabet.firstIndex(of: of)!
}
private func isSortedLoops(loops: [String]) -> Bool {
    for l in 1..<10 {
        var startL = -1
        
        for i in 0..<loops.count {
            if loops[i].count == l && index(loops[i][0]) < startL {
                return false
            } else if loops[i].count == l {
                startL = index(loops[i][0])
            }
        }
    }
    
    return true
}

private func generateLoops(loopsLenghts: [Int], i: Int, loops: [String]) {
    
    if i == alphabet.count && isNormalLoops(loops: loops) && isSortedLoops(loops: loops) {
        iter += 1
        solution9_1_5_NotEmpty.write("\(loops)\n")
    } else {
        alphabet.forEach { char in
            if !isUsedChar(char, in: loops) {
                for j in 0..<loops.count {
                    if loops[j].count < loopsLenghts[j] {
                        var newLoops = loops
                        newLoops[j] += char
                        generateLoops(loopsLenghts: loopsLenghts, i: i + 1, loops: newLoops)
                        break
                    }
                }
            }
        }
    }
}

func Problem915() {
    print("Problem 9.1.5:")
    solution9_1_5_NotEmpty.open()
        
    generateLoops(loopsLenghts: [6,1,1,1,1], i: 0, loops: ["","","","",""])
    generateLoops(loopsLenghts: [5,2,1,1,1], i: 0, loops: ["","","","",""])
    generateLoops(loopsLenghts: [4,3,1,1,1], i: 0, loops: ["","","","",""])
    generateLoops(loopsLenghts: [4,2,2,1,1], i: 0, loops: ["","","","",""])
    generateLoops(loopsLenghts: [3,3,2,1,1], i: 0, loops: ["","","","",""])
    generateLoops(loopsLenghts: [3,2,2,2,1], i: 0, loops: ["","","","",""])
    generateLoops(loopsLenghts: [2,2,2,2,2], i: 0, loops: ["","","","",""])

    solution9_1_5_NotEmpty.close()
    
    print(iter)
    iter = 0
}
