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

//private var solution5_1: String = ""
//private var solution5_2: String = ""

private var solutior5_1_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution5_1.txt"), append: true)!
private var solutior5_2_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution5_2.txt"), append: true)!

private var alphabet = ["a","b","c","d","e","f"]

// 3 a: C(4,3) * 5 = 20
// 4 a: 1
// result: 21
private func problem5_1(i: Int, prefix: String, k:Int) {
    let newI = i + 1

    if i == 4 {
        if k == 2 {
            solutior5_1_file.write(prefix + "a" + "\n")
            iter += 1
        } else {
            alphabet.forEach { char in
                solutior5_1_file.write(prefix + char + "\n")
                iter += 1
            }
        }
    } else if i == 3 && k == 1 {
        let newPref = prefix + "a"
        problem5_1(i: newI, prefix: newPref, k: 2)
    } else if i == 2 && k == 0 {
        let newPref = prefix + "a"
        problem5_1(i: newI, prefix: newPref, k: 1)
    } else {
        alphabet.forEach { char in
            let newPref = prefix + char
            let newK = k + (char == "a" ? 1 : 0)
            problem5_1(i: newI, prefix: newPref, k: newK)
        }
    }
}
// 3 a: C(7,3) * 5 * 5 * 5 * 5 = 21875
// 4 a: C(7,4) * 5 * 5 * 5 = 4375
// 5 a: C(7,5) * 5 * 5 = 525
// 6 a: C(7,6) * 5 = 35
// 7 a: 1
// result = 26811
private func problem5_2(i: Int, prefix: String, k: Int) {
    let newI = i + 1
    
    if i == 7 {
        if k == 2 {
            solutior5_2_file.write(prefix + "a" + "\n")
            iter += 1
        } else {
            alphabet.forEach { char in
                solutior5_2_file.write(prefix + char + "\n")
                iter += 1
            }
        }
    } else if i == 6 && k == 1 {
        let newPref = prefix + "a"
        problem5_2(i: newI, prefix: newPref, k: 2)
    } else if i == 5 && k == 0 {
        let newPref = prefix + "a"
        problem5_2(i: newI, prefix: newPref, k: 1)
    } else {
        alphabet.forEach { char in
            let newPref = prefix + char
            let newK = k + (char == "a" ? 1 : 0)
            problem5_2(i: newI, prefix: newPref, k: newK)
        }
    }
}

func Problem5() {
    print("Problem5:")

    solutior5_1_file.open()
    problem5_1(i: 1, prefix: "", k: 0)
    solutior5_1_file.close()

    print(iter)
    iter = 0
        
    solutior5_2_file.open()
    problem5_2(i: 1, prefix: "", k: 0)
    solutior5_2_file.close()

    print(iter)
    iter = 0

}
