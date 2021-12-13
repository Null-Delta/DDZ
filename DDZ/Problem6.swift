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

private var solution6_1_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution6_1.txt"), append: true)!


private var alphabet = ["a","b","c","d","e","f"]

// 4111: C(6,1) * C(7,4) * C(5,3) * 3 * 2 * 1 = 12600
// 3211: C(6,1) * C(7,3) * C(5,1) * C(4,2) * C(4,2) * 2 = 75600
// 2221: C(6,3) * C(7,2) * C(5,2) * C(3,2) * C(3,1) = 37800
// result = 126000
private func problem6(i: Int, prefix: String, k: Int) {
    let newI = i + 1
    
    if i == 7 {
        if k == 3 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    iter += 1
                    solution6_1_file.write(prefix + char + "\n")
                }
            }
        } else {
            alphabet.forEach { char in
                if prefix.contains(char) {
                    iter += 1
                    solution6_1_file.write(prefix + char + "\n")
                }
            }
        }
    } else if (4...6).contains(i) && i - k == 4 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newPref = prefix + char
                let newK = k + 1
                problem6(i: newI, prefix: newPref, k: newK)
            }
        }
    } else {
        alphabet.forEach { char in
            if k < 4 || prefix.contains(char) {
                let newPref = prefix + char
                let newK = k + (prefix.contains(char) ? 0 : 1)
                problem6(i: newI, prefix: newPref, k: newK)
            }
        }
    }
}

func Problem6() {
    print("Problem6:")

    solution6_1_file.open()
    problem6(i: 1, prefix: "", k: 0)
    solution6_1_file.close()

    print(iter)
    iter = 0
}
