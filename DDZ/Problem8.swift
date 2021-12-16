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

private func convertToArray(matrix: String) -> [(Int, [Int])] {
    var result: [(Int,[Int])] = []
    
    for i in 0..<4 {
        result.append((i, []))
    }
    
    for i in 0..<4 {
        for j in 0..<4 where j != i && matrix[i * 4 + j] == "1" {
            if !result[i].1.contains(j) {
                result[i].1.append(j)
            }
        }
    }
    
    print(result)
    return result
}

private func replace(matrix: [(Int, [Int])], from: Int, to: Int) -> [(Int,[Int])] {
    var result = matrix
    result.insert(result.remove(at: from), at: to)
    var t = result[from].0
    result[from].0 = result[to].0
    result[to].0 = t
    
    return result
}

private func printMatrix(matrix: String) {
    for i in 0..<4 {
        print(matrix[i * 4..<i * 4 + 4])
    }
    print()
}

private func isEqual(matrix1: String, matrix2: String) -> Bool {
    return matrix1 == matrix2
}

private func isAotumorfizm(matrix1: String, matrix2: String) -> Bool {
    return true
}

func Problem8() {
    let matrix1 = "0111000000000000"
    printMatrix(matrix: matrix1)
    
    print(replace(matrix: convertToArray(matrix: matrix1), from: 0, to: 2))
    //printMatrix(matrix: replace(matrix: matrix1, from: 0, to: 2))
}
