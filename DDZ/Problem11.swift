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
private var edgeCount = 20

private var solution11_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution11.txt"), append: true)!
//(C(20,5) =
private func problem11(i: Int, k: Int, prefix: String) {
    let newI = i + 1
    let newK = k + 1
    
    if i == edgeCount + 1 {
        iter += 1
        solution11_file.write(generateMatrix(of: prefix) + "\n")
    } else if (edgeCount - i + 1) - (q - k) == 0 {
        let newPref = prefix + "1"
        problem11(i: newI, k: newK, prefix: newPref)
    } else {
        if k < 5 {
            let newPref = prefix + "1"
            problem11(i: newI, k: newK, prefix: newPref)
        }
        let newPref = prefix + "0"
        problem11(i: newI, k: k, prefix: newPref)
    }
}

func Problem11() {
    print("Problem11:")

    solution11_file.open()
    problem11(i: 1, k: 0, prefix: "")
    solution11_file.close()
    
    print(iter)
    iter = 0
}
