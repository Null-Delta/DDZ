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

private var solution10_3: String = ""
private var alphabet = ["a","b","c","d","e","f","g","h","j","k"]

// 711: C(10,1) * C(9,7) * C(9,2) * 2 = 25920
// 621: C(10,1) * C(9,6) * C(9,1) * C(3,2) * C(8,1) = 181440
// 531: C(10,1) * C(9,5) * C(9,1) * C(4,3) * C(8,1) = 362880
// 522: C(10,1) * C(9,5) * C(9,2) * C(4,2) = 272160
// 441: C(10,2) * C(9,4) * C(5,4) * C(8,1) = 226800
// 432: C(10,1) * C(9,4) * C(9,1) * C(5,3) * C(8,1) = 907200
// 333: C(10,3) * C(9,3) * C(6,3) = 201600
// result = 2178000

private func problem10_3(i: Int, prefix: String, k: Int) {
    if i == 9 {
        if k == 2 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    solution10_3 += prefix + char + "\n"
                }
            }
        } else {
            alphabet.forEach { char in
                if prefix.contains(char) {
                    solution10_3 += prefix + char + "\n"
                }
            }
        }
    } else if (7...8).contains(i) && i - k == 7 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem10_3(i: i + 1, prefix: prefix + char, k: k + 1)
            }
        }
    } else {
        alphabet.forEach { char in
            if k < 3 || prefix.contains(char) {
                problem10_3(i: i + 1, prefix: prefix + char, k: k + (prefix.contains(char) ? 0 : 1))
            }
        }
    }
}

func Problem_IZ_10_3() {
    problem10_3(i: 1, prefix: "", k: 0)
    
    try! ("total count: \(solution10_3.split(separator: "\n").count)\n" + solution10_3).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution_iz_10_3.txt"), atomically: true, encoding: .utf8)
}
