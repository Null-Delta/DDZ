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
private var edgeCount = 20

private var solution12_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution12.txt"), append: true)!

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

//2^(2 * C(p,2)) = 2^(20) = 1048576

private func problem12(i: Int, prefix: String) {
    let newI = i + 1
    if i == edgeCount + 1 {
        iter += 1
        solution12_file.write(generateMatrix(of: prefix) + "\n")
    } else {
        let pref1 = prefix + "0"
        let pref2 = prefix + "1"
        problem12(i: newI, prefix: pref1)
        problem12(i: newI, prefix: pref2)
    }
}

func Problem12() {
    solution12_file.open()
    problem12(i: 1, prefix: "")
    solution12_file.close()
    
    print(iter)
    iter = 0
}

