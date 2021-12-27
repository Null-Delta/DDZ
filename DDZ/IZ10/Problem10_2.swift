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
private var n = 10
private var k = 3
private var m = 4

private var solution10_2 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution10_2.txt"), append: true)!

private var alphabet = ["a","b","c","d","e","f","g","h","j","k"]

private func problem10_1(i: Int, prefix: String, chars: [(String, Int)]) {
    let newI = i + 1
    
    //удаление повторов
    if (chars[0].1 > 0 && chars[1].1 > 0 && chars[2].1 > 0) && !(chars[0].0 < chars[1].0 && chars[1].0 < chars[2].0) {
        return
    }
    
    if i == n + 1 {
        iter += 1
        if iter % 1000000 == 0 {
            print(iter)
        }
        
        solution10_2.write(prefix + "\n")
    } else if n - i - k == (6 - 1 - chars[0].1 - chars[1].1 - chars[2].1 - chars[3].1) {
        subProblem10_1(i: i, prefix: prefix, chars: chars)
    } else {
        alphabet.forEach { char in
            let newPref = prefix + char
            if prefix.contains(char) {
                if chars[0].0 == char && chars[0].1 == 1 {
                    problem10_1(i: newI, prefix: newPref, chars: [(char, 2),chars[1],chars[2],chars[3]])
                } else if chars[1].0 == char && chars[1].1 == 1 {
                    problem10_1(i: newI, prefix: newPref, chars: [chars[0],(char, 2),chars[2],chars[3]])
                } else if chars[2].0 == char && chars[2].1 == 1 {
                    problem10_1(i: newI, prefix: newPref, chars: [chars[0],chars[1],(char,2),chars[3]])
                } else if chars[3].0 == char && chars[3].1 < k {
                    problem10_1(i: newI, prefix: newPref, chars: [chars[0],chars[1],chars[2],(char, chars[3].1 + 1)])
                }
            } else {
                problem10_1(i: newI, prefix: newPref, chars: chars)
                
                if chars[0].1 == 0 {
                    problem10_1(i: newI, prefix: newPref, chars: [(char,1), chars[1], chars[2], chars[3]])
                }
                
                if chars[1].1 == 0 {
                    problem10_1(i: newI, prefix: newPref, chars: [chars[0], (char,1), chars[2], chars[3]])
                }
                
                if chars[2].1 == 0 {
                    problem10_1(i: newI, prefix: newPref, chars: [chars[0], chars[1], (char,1), chars[3]])
                }
                
                if chars[3].1 == 0 {
                    problem10_1(i: newI, prefix: newPref, chars: [chars[0], chars[1], chars[2], (char,1)])
                }
            }
        }
    }
}

private func subProblem10_1(i: Int, prefix: String, chars: [(String, Int)]) {
    let newIter = i + 1
    if chars[0].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newPrefix = prefix + char
                problem10_1(i: newIter, prefix: newPrefix, chars: [(char,1),chars[1],chars[2],chars[3]])
            }
        }
    } else if chars[0].1 == 1 {
        let newPrefix = prefix + chars[0].0
        problem10_1(i: newIter, prefix: newPrefix, chars: [(chars[0].0, chars[0].1 + 1),chars[1],chars[2],chars[3]])
    }
    
    if chars[1].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newPrefix = prefix + char
                problem10_1(i: newIter, prefix: newPrefix, chars: [chars[0],(char,1),chars[2],chars[3]])
            }
        }
    } else if chars[1].1 == 1 {
        let newPrefix = prefix + chars[1].0
        problem10_1(i: newIter, prefix: newPrefix, chars: [chars[0],(chars[1].0, chars[1].1 + 1),chars[2],chars[3]])
    }
    
    if chars[2].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newPrefix = prefix + char
                problem10_1(i: newIter, prefix: newPrefix, chars: [chars[0],chars[1],(char,1),chars[3]])
            }
        }
    } else if chars[2].1 == 1 {
        let newPrefix = prefix + chars[2].0
        problem10_1(i: newIter, prefix: newPrefix, chars: [chars[0],chars[1],(chars[2].0, chars[2].1 + 1),chars[3]])
    }
    
    if chars[3].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newPrefix = prefix + char
                problem10_1(i: newIter, prefix: newPrefix, chars: [chars[0],chars[1],chars[2],(char,1)])
            }
        }
    } else if chars[3].1 < k {
        let newPrefix = prefix + chars[3].0
        problem10_1(i: newIter, prefix: newPrefix, chars: [chars[0],chars[1],chars[2],(chars[3].0, chars[3].1 + 1)])
    }
}

func Problem_IZ_10_2() {
    print("Problem10.2:")

    solution10_2.open()
    problem10_1(i: 1, prefix: "", chars: [("",0),("",0),("",0), ("",0)])
    solution10_2.close()
    
    print(iter)
    iter = 0
}
