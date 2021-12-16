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
private var solution10_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution10.txt"), append: true)!
private var n: Int = 0
private var automorfizms: [String] = []

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
            solution10_file.write(prefix + "\n")
            automorfizms.append(prefix)
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

private func problem10(i: Int, prefix: String) {
    if i == alphabet.count + 1 {
        
        var localAutomorfs:[String] = []
        for j in automorfizms {
            localAutomorfs.append(composite(f1: prefix, f2: j))
        }
        
        if localAutomorfs.min()! == prefix {
            iter += 1
            var matrix = convertToArray(matrix: matrix1)
            
            for g in toTransArray(value: prefix) {
                matrix = replace(matrix: matrix, from: g.0, to: g.1)
            }
            
            solution10_file.write(generateMatrix(of: convertToMatrix(m: matrix)) + "\n")
        }
        
    } else {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newI = i + 1
                let newPref = prefix + char
                problem10(i: newI, prefix: newPref)
            }
        }
    }
}

private func composite(f1: String, f2: String) -> String {
    var result = ""
    
    for i in 0..<f1.count {
        result.append(f2[Int(f1[i])!])
    }
    
    return result
}

func Problem10() {
    print("Problem10:")

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
    
    problem9(i: 1, prefix: "")
    
    solution10_file.open()
    problem10(i: 1, prefix: "")
    solution10_file.close()

    print(iter)
    iter = 0
}
