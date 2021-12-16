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
// 1 2 3 4    3 2 1 4

// 0 1 1 1    0 0 1 0
// 1 0 0 0 -> 0 0 1 0
// 1 0 0 0    1 1 0 1
// 1 0 0 0    0 0 1 0

// 0 1 0 1    0 0 0 0
// 1 0 0 0 -> 0 0 1 0
// 0 0 0 0    0 1 0 1
// 1 0 0 0    0 0 1 0
private var alphabet = ["0","1","2","3"]

private var wasAutomorfizm: Bool = false

private var matrix1: String = ""
private var matrix2: String = ""
private var n: Int = 0

private func convertToArray(matrix: String) -> [(Int, [Int])] {
    var result: [(Int,[Int])] = []
    
    for i in 0..<n {
        result.append((i, []))
    }
    
    for i in 0..<n {
        for j in 0..<n where j != i && matrix[i * n + j] == "1" {
            if !result[i].1.contains(j) {
                result[i].1.append(j)
            }
        }
    }
    
    //print(result)
    return result
}

private func convertToMatrix(m: [(Int, [Int])]) -> String {
    var result = ""
    for i in 0..<n {
        for j in 0..<n {
            result += m[i].1.contains(j) ? "1" : "0"
        }
    }
    
    return result
}

private func replace(matrix: [(Int, [Int])], from: Int, to: Int) -> [(Int,[Int])] {
    var result = matrix
    
    result[from].0 = to
    result[to].0 = from
    
    for j in 0..<result.count {
        for i in 0..<result[j].1.count {
            if result[j].1[i] == from {
                result[j].1[i] = to
            } else if result[j].1[i] == to {
                result[j].1[i] = from
            }
        }
    }

    result.sort(by: {(v1,v2) in v1.0 < v2.0})
    return result
}

private func printMatrix(matrix: String) {
    for i in 0..<n {
        print(matrix[i * n..<i * n + n])
    }
    print()
}

private func isEqual(matrix1: String, matrix2: String) -> Bool {
    return matrix1 == matrix2
}

private func isAotumorfizm(matrix1: String, matrix2: String) -> Bool {
    return true
}

private func problem8(i: Int, prefix: String) {
    if i == alphabet.count + 1 {
        if !wasAutomorfizm {
            var transMatrix = convertToArray(matrix: matrix2)
            
            for p in toTransArray(value: prefix) {
                transMatrix = replace(matrix: transMatrix, from: p.1, to: p.0)
            }
            
            if convertToMatrix(m: transMatrix) == matrix1 {
                wasAutomorfizm = true
            }
        }
    } else {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newI = i + 1
                let newPref = prefix + char
                problem8(i: newI, prefix: newPref)
            }
        }
    }
}



private func toTransArray(value: String) -> [(Int, Int)] {
    var result: [(Int, Int)] = []
    
    for i in 0..<value.count {
        for j in i..<value.count where Int(value[j])! < Int(value[i])! {
            result.append((Int(value[i])!,Int(value[j])!))
        }
    }
        
    return result
}

func Problem8() {
    print("Введите размерность матрицы:")
    n = Int(readLine()!)!
    
    print("Введите первую матрицу:")
    for _ in 0..<n {
        matrix1 += readLine()!
    }
    
    print("Введите вторую матрицу:")
    for _ in 0..<n {
        matrix2 += readLine()!
    }
    
    alphabet = []
    for i in 0..<n {
        alphabet.append("\(i)")
    }
    
    problem8(i: 1, prefix: "")
    
    print(wasAutomorfizm)
}
