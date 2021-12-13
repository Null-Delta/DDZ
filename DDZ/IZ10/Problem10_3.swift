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

private var solution10_3 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution10_3.txt"), append: true)!

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
    let newI = i + 1
    
    if i == 9 {
        if k == 2 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    iter += 1
                    solution10_3.write(prefix + char + "\n")
                }
            }
        } else {
            alphabet.forEach { char in
                if prefix.contains(char) {
                    iter += 1
                    solution10_3.write(prefix + char + "\n")
                }
            }
        }
    } else if (7...8).contains(i) && i - k == 7 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newPref = prefix + char
                let newK = k + 1
                problem10_3(i: newI, prefix: newPref, k: newK)
            }
        }
    } else {
        alphabet.forEach { char in
            if k < 3 || prefix.contains(char) {
                let newPref = prefix + char
                let newK = k + (prefix.contains(char) ? 0 : 1)
                problem10_3(i: newI, prefix: newPref, k: newK)
            }
        }
    }
}

func Problem_IZ_10_3() {
    print("Problem10.3:")

    solution10_3.open()
    problem10_3(i: 1, prefix: "", k: 0)
    solution10_3.close()
    
    print(iter)
    iter = 0
}
