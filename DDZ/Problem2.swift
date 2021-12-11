import Foundation

private var solution2: String = ""

private func problem2(i: Int, k: Int, prefix: String) {
    if i == 5 {
        if k == 1 {
            solution2 += prefix + "a" + "\n"
        } else {
            ["b","c","d","e","f"].forEach { ch in
                solution2 += prefix + ch + "\n"
            }
        }
    } else if i == 4 && k == 0 {
        problem2(i: i + 1, k: 1, prefix: prefix + "a")
    } else {
        ["a","b","c","d","e","f"].forEach { ch in
            if !(k == 2 && ch == "a") {
                problem2(i: i + 1, k: k + (ch == "a" ? 1 : 0), prefix: prefix + ch)
            }
        }
    }
}

func Problem2() {
    problem2(i: 1, k: 0, prefix: "")
    try! solution2.write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution2.txt"), atomically: true, encoding: .utf8)
}
