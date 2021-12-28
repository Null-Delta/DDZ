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

private var solution10_5 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution10_5.txt"), append: true)!


private var alphabet = ["к","о","т","й","р","н","е"]

// 9! / (2! * 2!) = 90720
private func problem10_5(i: Int, nk: Int, ek: Int, prefix: String) {
    let newI = i + 1
    
    if i == 9 {
        if nk == 1 {
            iter += 1
            solution10_5.write(prefix + "н" + "\n")
        } else if ek == 1 {
            iter += 1
            solution10_5.write(prefix + "е" + "\n")
        } else {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    iter += 1
                    solution10_5.write(prefix + char + "\n")
                }
            }
        }
    } else if (6...8).contains(i) && i - nk - ek == 6 {
        if nk != 2 {
            let newNK = nk + 1
            let newPref = prefix + "н"
            problem10_5(i: newI, nk: newNK, ek: ek, prefix: newPref)
        }
        if ek != 2 {
            let newEK = ek + 1
            let newPref = prefix + "е"
            problem10_5(i: newI, nk: nk, ek: newEK, prefix: newPref)
        }
    } else {
        alphabet.forEach { char in
            if char == "н" && nk != 2 || char == "е" && ek != 2 {
                let newNK = nk + (char == "н" ? 1 : 0)
                let newEK = ek + (char == "е" ? 1 : 0)
                let newPref = prefix + char
                problem10_5(i: newI, nk: newNK, ek: newEK, prefix: newPref)
            } else if char != "н" && char != "е" && !prefix.contains(char) {
                let newPref = prefix + char
                problem10_5(i: newI, nk: nk, ek: ek, prefix: newPref)
            }
        }
    }
}

func Problem_IZ_10_5() {
    print("Problem10.5:")

    solution10_5.open()
    problem10_5(i: 1, nk: 0, ek: 0, prefix: "")
    solution10_5.close()
    print(iter)
    iter = 0
    
}
