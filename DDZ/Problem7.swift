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

private var p = 5
private var q = 5
private var edgeCount = 10

private var solution7_1_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution7_1.txt"), append: true)!
private var solution7_2_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution7_2.txt"), append: true)!

// C(C(p,2),q) = C(C(5,2),5) = C(10,5) = 2 * 7 * 2 * 9 = 63 * 4 = 252
private func problem7_1(i: Int, k: Int, prefix: String) {
    let newI = i + 1
    let newK = k + 1
    if i == edgeCount + 1 {
        iter += 1
        solution7_1_file.write(generateMatrix(of: prefix + prefix) + "\n")
    } else if (edgeCount - i + 1) - (q - k) == 0 {
        let newPref = prefix + "1"
        problem7_1(i: newI, k: newK, prefix: newPref)
    } else {
        if k < 5 {
            let newPref = prefix + "1"
            problem7_1(i: newI, k: newK, prefix: newPref)
        }
        let newPref = prefix + "0"
        problem7_1(i: newI, k: k, prefix: newPref)
    }
}

// 1024
private func problem7_2(i: Int, prefix: String) {
    let newI = i + 1
    if i == edgeCount + 1 {
        iter += 1
        solution7_2_file.write(generateMatrix(of: prefix + prefix) + "\n")
    } else {
        let pref1 = prefix + "0"
        let pref2 = prefix + "1"
        problem7_2(i: newI, prefix: pref1)
        problem7_2(i: newI, prefix: pref2)
    }
}

func Problem7() {
    print("Problem7:")

    solution7_1_file.open()
    problem7_1(i: 1,k: 0,prefix: "")
    solution7_1_file.close()
    
    print(iter)
    iter = 0
    
    solution7_2_file.open()
    problem7_2(i: 1, prefix: "")
    solution7_2_file.close()
    
    print(iter)
    iter = 0
}
