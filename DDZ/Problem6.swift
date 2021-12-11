import Foundation

private var solution6_1: String = ""
private var alphabet = ["a","b","c","d","e","f"]

// 4111: C(6,1) * C(7,4) * C(5,3) * 3 * 2 * 1 = 12600
// 3211: C(6,1) * C(7,3) * C(5,1) * C(4,2) * C(4,2) * 2 = 75600
// 2221: C(6,3) * C(7,2) * C(5,2) * C(3,2) * C(3,1) = 37800
// result = 126000
private func problem6(i: Int, prefix: String, k: Int) {
    if i == 7 {
        if k == 3 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    solution6_1 += prefix + char + "\n"
                }
            }
        } else {
            alphabet.forEach { char in
                if prefix.contains(char) {
                    solution6_1 += prefix + char + "\n"
                }
            }
        }
    } else if (4...6).contains(i) && i - k == 4 {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                problem6(i: i + 1, prefix: prefix + char, k: k + 1)
            }
        }
    } else {
        alphabet.forEach { char in
            if k < 4 || prefix.contains(char) {
                problem6(i: i + 1, prefix: prefix + char, k: k + (prefix.contains(char) ? 0 : 1))
            }
        }
    }
}

func Problem6() {
    problem6(i: 1, prefix: "", k: 0)
    
    try! ("total count: \(solution6_1.split(separator: "\n").count)\n" + solution6_1).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution6_1.txt"), atomically: true, encoding: .utf8)
}
