import Foundation

private var solution2_1: String = ""
private var solution2_2: String = ""

//C(2,5) * 5 * 5 * 5 = 1250
private func problem2_1(i: Int, k: Int, prefix: String) {
    if i == 5 {
        if k == 1 {
            solution2_1 += prefix + "a" + "\n"
        } else {
            ["b","c","d","e","f"].forEach { ch in
                solution2_1 += prefix + ch + "\n"
            }
        }
    } else if i == 4 && k == 0 {
        problem2_1(i: i + 1, k: 1, prefix: prefix + "a")
    } else {
        ["a","b","c","d","e","f"].forEach { ch in
            if !(k == 2 && ch == "a") {
                problem2_1(i: i + 1, k: k + (ch == "a" ? 1 : 0), prefix: prefix + ch)
            }
        }
    }
}

//C(2,5) * C(5,1) * C(4,1) * C(3,1) = 600
private func problem2_2(i: Int, k: Int, prefix: String, used: String) {
    if i == 5 {
        if k == 1 {
            solution2_2 += prefix + "a" + "\n"
        } else {
            ["b","c","d","e","f"].forEach { ch in
                if !used.contains(ch) {
                    solution2_2 += prefix + ch + "\n"
                }
            }
        }
    } else if i == 4 && k == 0 {
        problem2_2(i: i + 1, k: 1, prefix: prefix + "a", used: used)
    } else {
        ["a","b","c","d","e","f"].forEach { ch in
            if !used.contains(ch) {
                if !(k == 2 && ch == "a") {
                    problem2_2(i: i + 1, k: k + (ch == "a" ? 1 : 0), prefix: prefix + ch, used: ch == "a" ? used : used + ch)
                }
            }
        }
    }
}

func Problem2() {
    problem2_1(i: 1, k: 0, prefix: "")
    try! ("total count: \(solution2_1.split(separator: "\n").count)\n" + solution2_1).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution2_1.txt"), atomically: true, encoding: .utf8)

    problem2_2(i: 1, k: 0, prefix: "", used: "")
    try! ("total count: \(solution2_2.split(separator: "\n").count)\n" + solution2_2).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution2_2.txt"), atomically: true, encoding: .utf8)
}
