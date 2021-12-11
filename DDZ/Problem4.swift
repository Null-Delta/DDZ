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

private var alphabet = ["a","b","c","d","e","f"]
private var solution4_1: String = ""
private var solution4_2: String = ""

//C(6,1) * C(7,2) * C(5,1) * C(5,3) * C(4,2) * 2 = 75600
//ТИЛЬТ
private func problem4_1(i: Int, prefix: String, k1: (String, Int), k2: (String, Int)) {
    if i == 7 {
        if k1.1 == 3 && k2.1 == 1 {
            solution4_1 += prefix + k2.0 + "\n"
        } else if k1.1 == 2 && k2.1 == 2 {
            solution4_1 += prefix + k1.0 + "\n"
        } else {
            alphabet.forEach { char in
                if char != k1.0 && char != k2.0 && !prefix.contains(char) {
                    solution4_1 += prefix + char + "\n"
                }
            }
        }
    } else if (3...6).contains(i) && i + (3 - k1.1 + 2 - k2.1) == 8 {
        subProblem4_1(i: i, prefix: prefix, k1: k1, k2: k2)
    }
    else {
        alphabet.forEach { char in
            if prefix.contains(char) {
                if k1.1 > 0 && k1.1 < 3 && char == k1.0 {
                    problem4_1(i: i + 1, prefix: prefix + char, k1: (k1.0, k1.1 + 1), k2: k2)
                } else if k2.1 > 0 && k2.1 < 2 && char == k2.0 {
                    problem4_1(i: i + 1, prefix: prefix + char, k1: k1, k2: (k2.0, k2.1 + 1))
                }
            } else {
                if k1.0 != char && k2.0 != char {
                    problem4_1(i: i + 1, prefix: prefix + char, k1: k1, k2: k2)
                }
                if k1.1 == 0 {
                    problem4_1(i: i + 1, prefix: prefix + char, k1: (char, 1), k2: k2)
                }
                if k2.1 == 0 {
                    problem4_1(i: i + 1, prefix: prefix + char, k1: k1, k2: (char, 1))
                }
            }
        }
    }
}

private func subProblem4_1(i: Int, prefix: String, k1: (String, Int), k2: (String, Int)) {
    if k1.1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem4_1(i: i + 1, prefix: prefix + char, k1: (char,1), k2: k2)
            }
        }
    } else if k1.1 == 1 || k1.1 == 2 {
        problem4_1(i: i + 1, prefix: prefix + k1.0, k1: (k1.0,k1.1 + 1), k2: k2)
    }
    
    if k2.1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem4_1(i: i + 1, prefix: prefix + char, k1: k1, k2: (char, 1))
            }
        }
    } else if k2.1 == 1 {
        problem4_1(i: i + 1, prefix: prefix + k2.0, k1: k1, k2: (k2.0, k2.1 + 1))
    }
}

//C(6,2) * C(9,2) * C(7,2) * C(4,1) * C(5,3) * C(3,2) * 2 = 2721600
//МЕГА ТИЛЬТ
private func problem4_2(i: Int, prefix: String, k1: (String, Int), k2: (String, Int), k3: (String, Int)) {
    //удаляем повторы
    if k2.0 != "" && k3.0 != "" && alphabet.firstIndex(of: k2.0)! > alphabet.firstIndex(of: k3.0)! {
        return
    }
    
    if i == 9 {
        if k1.1 == 2 {
            solution4_2 += prefix + k1.0 + "\n"
        } else if k2.1 == 1 {
            solution4_2 += prefix + k2.0 + "\n"
        } else if k3.1 == 1 {
            solution4_2 += prefix + k3.0 + "\n"
        } else {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    solution4_2 += prefix + char + "\n"
                }
            }
        }
    } else if (3...8).contains(i) && i + (3 - k1.1 + 2 - k2.1 + 2 - k3.1) == 10 {
        subProblem4_2(i: i, prefix: prefix, k1: k1, k2: k2, k3: k3)
    } else {
        alphabet.forEach { char in
            if prefix.contains(char) {
                if k1.1 > 0 && k1.1 < 3 && char == k1.0 {
                    problem4_2(i: i + 1, prefix: prefix + char, k1: (k1.0, k1.1 + 1), k2: k2, k3: k3)
                } else if k2.1 > 0 && k2.1 < 2 && char == k2.0 {
                    problem4_2(i: i + 1, prefix: prefix + char, k1: k1, k2: (k2.0, k2.1 + 1), k3: k3)
                } else if k3.1 > 0 && k3.1 < 2 && char == k3.0 {
                    problem4_2(i: i + 1, prefix: prefix + char, k1: k1, k2: k2, k3: (k3.0, k3.1 + 1))
                }
            } else {
                if char != k1.0 && char != k2.0 && char != k3.0 {
                    problem4_2(i: i + 1, prefix: prefix + char, k1: k1, k2: k2, k3: k3)
                }
                
                if k1.1 == 0 {
                    problem4_2(i: i + 1, prefix: prefix + char, k1: (char, 1), k2: k2, k3: k3)
                }
                if k2.1 == 0 {
                    problem4_2(i: i + 1, prefix: prefix + char, k1: k1, k2: (char,  1), k3: k3)
                }
                if k3.1 == 0 {
                    problem4_2(i: i + 1, prefix: prefix + char, k1: k1, k2: k2, k3: (char, 1))
                }
            }
        }
    }
}

private func subProblem4_2(i: Int, prefix: String, k1: (String, Int), k2: (String, Int), k3: (String, Int)) {
    if k1.1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem4_2(i: i + 1, prefix: prefix + char, k1: (char,1), k2: k2, k3: k3)
            }
        }
    } else if k1.1 == 1 || k1.1 == 2 {
        problem4_2(i: i + 1, prefix: prefix + k1.0, k1: (k1.0, k1.1 + 1), k2: k2, k3: k3)
    }
    if k2.1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem4_2(i: i + 1, prefix: prefix + char, k1: k1, k2: (char,1), k3: k3)
            }
        }
    } else if k2.1 == 1 {
        problem4_2(i: i + 1, prefix: prefix + k2.0, k1: k1, k2: (k2.0, k2.1 + 1), k3: k3)
    }
    
    if k3.1 == 0 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem4_2(i: i + 1, prefix: prefix + char, k1: k1, k2: k2, k3: (char, 1))
            }
        }
    } else if k3.1 == 1 {
        problem4_2(i: i + 1, prefix: prefix + k3.0, k1: k1, k2: k2, k3: (k3.0, k3.1 + 1))
    }
}

func Problem4() {
    problem4_1(i: 1, prefix: "", k1: ("",0), k2: ("",0))
    print(solution4_1.split(separator: "\n").count)
    
    try! ("total count: \(solution4_1.split(separator: "\n").count)\n" + solution4_1).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution4_1.txt"), atomically: true, encoding: .utf8)
    
    problem4_2(i: 1, prefix: "", k1: ("",0), k2: ("",0), k3: ("",0))
    
    try! ("total count: \(solution4_2.split(separator: "\n").count)\n" + solution4_2).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution4_2.txt"), atomically: true, encoding: .utf8)

}

