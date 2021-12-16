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

private var matrix1: String = ""
private var alphabet: [String] = []
private var solution9_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9.txt"), append: true)!
private var n: Int = 0

// 0111
// 1010
// 1101
// 1010

// 0123, 0321, 2130, 2301
private func problem9(i: Int, prefix: String) {
    if i == alphabet.count + 1 {
        var transMatrix = convertToArray(matrix: matrix1)
        
        for p in toTransArray(value: prefix) {
            transMatrix = replace(matrix: transMatrix, from: p.1, to: p.0)
        }
        
        if convertToMatrix(m: transMatrix) == matrix1 {
            iter += 1
            solution9_file.write(prefix + "\n")
        }
    } else {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newI = i + 1
                let newPref = prefix + char
                problem9(i: newI, prefix: newPref)
            }
        }
    }
}

func Problem9() {
    print("Problem9:")

    print("Введите размерность матрицы:")
    n = Int(readLine()!)!
    
    print("Введите матрицу:")
    for _ in 0..<n {
        matrix1 += readLine()!
    }
    print()
    
    alphabet = []
    for i in 0..<n {
        alphabet.append("\(i)")
    }
    
    solution9_file.open()
    problem9(i: 1, prefix: "")
    solution9_file.close()
    
    print(iter)
    iter = 0
}
