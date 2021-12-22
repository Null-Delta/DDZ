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

private var solution10_1 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution10_1.txt"), append: true)!

private var alphabet = ["a","b","c","d","e","f","g","h","j","k"]

// C(10,3) * C(10,2) * C(8,2) * C(6,2) * C(7,1) * C(4,3) * 6 = 381 024 000

private func problem10_1(i: Int, prefix: String, chars: [(String, Int)]) {
    //TODO: удаление повторов
    if (chars[0].1 > 0 && chars[1].1 > 0 && chars[2].1 > 0) && !(chars[0].0 < chars[1].0 && chars[1].0 < chars[2].0) {
        return
    }
    
    if i == n + 1 {
        iter += 1
        solution10_1.write(prefix + "\n")
    } else if n - i - k == (6 - 1 - chars[0].1 - chars[1].1 - chars[2].1 - chars[3].1) {
        subProblem10_1(i: i, prefix: prefix, chars: chars)
    } else {
        alphabet.forEach { char in
            if prefix.contains(char) {
                if chars[0].0 == char && chars[0].1 == 1 {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [(char, 2),chars[1],chars[2],chars[3]])
                } else if chars[1].0 == char && chars[1].1 == 1 {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0],(char, 2),chars[2],chars[3]])
                } else if chars[2].0 == char && chars[2].1 == 1 {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0],chars[1],(char,2),chars[3]])
                } else if chars[3].0 == char && chars[3].1 < k {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0],chars[1],chars[2],(char, chars[3].1 + 1)])
                }
            } else {
                problem10_1(i: i + 1, prefix: prefix + char, chars: chars)
                
                if chars[0].1 == 0 {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [(char,1), chars[1], chars[2], chars[3]])
                }
                
                if chars[1].1 == 0 {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0], (char,1), chars[2], chars[3]])
                }
                
                if chars[2].1 == 0 {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0], chars[1], (char,1), chars[3]])
                }
                
                if chars[3].1 == 0 {
                    problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0], chars[1], chars[2], (char,1)])
                }
            }
        }
    }
}

private func subProblem10_1(i: Int, prefix: String, chars: [(String, Int)]) {
    if chars[0].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem10_1(i: i + 1, prefix: prefix + char, chars: [(char,1),chars[1],chars[2],chars[3]])
            }
        }
    } else if chars[0].1 == 1 {
        problem10_1(i: i + 1, prefix: prefix + chars[0].0, chars: [(chars[0].0, chars[0].1 + 1),chars[1],chars[2],chars[3]])
    }
    
    if chars[1].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0],(char,1),chars[2],chars[3]])
            }
        }
    } else if chars[1].1 == 1 {
        problem10_1(i: i + 1, prefix: prefix + chars[1].0, chars: [chars[0],(chars[1].0, chars[1].1 + 1),chars[2],chars[3]])
    }
    
    if chars[2].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0],chars[1],(char,1),chars[3]])
            }
        }
    } else if chars[2].1 == 1 {
        problem10_1(i: i + 1, prefix: prefix + chars[2].0, chars: [chars[0],chars[1],(chars[2].0, chars[2].1 + 1),chars[3]])
    }
    
    if chars[3].1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem10_1(i: i + 1, prefix: prefix + char, chars: [chars[0],chars[1],chars[2],(char,1)])
            }
        }
    } else if chars[3].1 < k {
        problem10_1(i: i + 1, prefix: prefix + chars[3].0, chars: [chars[0],chars[1],chars[2],(chars[3].0, chars[3].1 + 1)])
    }
}

func Problem_IZ_10_1() {
    print("Problem10.1:")

    solution10_1.open()
    problem10_1(i: 1, prefix: "", chars: [("",0),("",0),("",0), ("",0)])
    solution10_1.close()
    
    print(iter)
    iter = 0
}
