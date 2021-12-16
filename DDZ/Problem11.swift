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

private func generateMatrix(of: String) -> String {
    var offset: Int = 0
    var result = ""
    for i in 0..<p {
        for j in 0..<i {
            result += of[of.index(of.startIndex, offsetBy: (p - 1) * (j) - (j * (j + 1)) / 2 + i - 1 + 10)..<of.index(of.startIndex, offsetBy: (p - 1) * (j) - (j * (j + 1)) / 2 + i + 10)] + " "
        }
        result += "0 "
        
        for j in i + 1..<p {
            result += "\(of[of.index(of.startIndex, offsetBy: j - i - 1 + offset)..<of.index(of.startIndex, offsetBy: j - i - 1 + offset + 1)]) "
        }
        offset += p - i - 1
        result += "\n"
    }
    
    
    return result
}

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
    solution11_file.open()
    problem11(i: 1, k: 0, prefix: "")
    solution11_file.close()
    
    print(iter)
    iter = 0
}
