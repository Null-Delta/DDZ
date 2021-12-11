import Foundation

private var solution5_1: String = ""
private var solution5_2: String = ""
private var alphabet = ["a","b","c","d","e","f"]

// 3 a: C(4,3) * 5 = 20
// 4 a: 1
// result: 21
private func problem5_1(i: Int, prefix: String, k:Int) {
    if i == 4 {
        if k == 2 {
            solution5_1 += prefix + "a" + "\n"
        } else {
            alphabet.forEach { char in
                solution5_1 += prefix + char + "\n"
            }
        }
    } else if i == 3 && k == 1 {
        problem5_1(i: i + 1, prefix: prefix + "a", k: 2)
    } else if i == 2 && k == 0 {
        problem5_1(i: i + 1, prefix: prefix + "a", k: 1)
    } else {
        alphabet.forEach { char in
            problem5_1(i: i + 1, prefix: prefix + char, k: k + (char == "a" ? 1 : 0))
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
    if i == 7 {
        if k == 2 {
            solution5_2 += prefix + "a" + "\n"
        } else {
            alphabet.forEach { char in
                solution5_2 += prefix + char + "\n"
            }
        }
    } else if i == 6 && k == 1 {
        problem5_2(i: i + 1, prefix: prefix + "a", k: 2)
    } else if i == 5 && k == 0 {
        problem5_2(i: i + 1, prefix: prefix + "a", k: 1)
    } else {
        alphabet.forEach { char in
            problem5_2(i: i + 1, prefix: prefix + char, k: k + (char == "a" ? 1 : 0))
        }
    }
}

func Problem5() {
    problem5_1(i: 1, prefix: "", k: 0)
        
    try! ("total count: \(solution5_1.split(separator: "\n").count)\n" + solution5_1).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution5_1.txt"), atomically: true, encoding: .utf8)

    
    problem5_2(i: 1, prefix: "", k: 0)
    
    try! ("total count: \(solution5_2.split(separator: "\n").count)\n" + solution5_2).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution5_2.txt"), atomically: true, encoding: .utf8)

}
