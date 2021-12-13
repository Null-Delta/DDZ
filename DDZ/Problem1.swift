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

private var alphabet = ["a","b","c","d", "e", "f"]

private var solution1_1 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution1_1.txt"), append: true)!
private var solution1_2 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution1_2.txt"), append: true)!
private var solution1_3 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution1_3.txt"), append: true)!
private var solution1_4 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution1_4.txt"), append: true)!
private var solution1_5 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution1_5.txt"), append: true)!
private var solution1_6 = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution1_6.txt"), append: true)!

//n^k (6^5) = 7776
private func problem1_1(i: Int, prefix: String, k: Int) {
    if i == k {
        alphabet.forEach { char in
            iter += 1
            solution1_1.write(prefix + char + "\n")
        }
    } else {
        alphabet.forEach { char in
            let newI = i + 1
            let newPref = prefix + char
            problem1_1(i: newI, prefix: newPref, k: k)
        }
    }
}

//n! (6!) = 720
private func problem1_2(i: Int, prefix: String) {
    if i == alphabet.count {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                iter += 1
                solution1_2.write(prefix + char + "\n")
            }
        }
    } else {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newI = i + 1
                let newPref = prefix + char
                problem1_2(i: newI, prefix: newPref)
            }
        }
    }
}

//1 * 2 * 3 * ... * k
private func problem1_3(i: Int, prefix: String,k: Int) {
    if i == k {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                iter += 1
                solution1_3.write(prefix + char + "\n")
            }
        }
    } else {
        alphabet.forEach { char in
            if !prefix.contains(char) {
                let newI = i + 1
                let newPref = prefix + char
                problem1_3(i: newI, prefix: newPref, k: k)
            }
        }
    }
}

//2^n (n == 6) == 1024
private func problem1_4(i: Int, prefix: String) {
    let newI = i + 1
    if i == alphabet.count + 1 {
        iter += 1
        solution1_4.write(prefix + "\n")
    } else {
        alphabet.forEach { char in
            var isNormal = true
            prefix.forEach { char2 in
                if alphabet.firstIndex(of: String(char2))! > alphabet.firstIndex(of: char)! {
                    isNormal = false
                }
            }
            if !prefix.contains(char) && isNormal {
                let newPref = prefix + char
                iter += 1
                solution1_4.write(newPref + "\n")
                problem1_4(i: newI, prefix: newPref)
            }
        }
    }
}

//C(n,k) = C(6,4) = 15
private func problem1_5(i: Int, prefix: String, k: Int) {
    let newI = i + 1
    if i == k + 1 {
        iter += 1
        solution1_5.write(prefix + "\n")
    } else {
        alphabet.forEach { char in
            var isNormal = true
            prefix.forEach { char2 in
                if alphabet.firstIndex(of: String(char2))! > alphabet.firstIndex(of: char)! {
                    isNormal = false
                }
            }
            if !prefix.contains(char) && isNormal {
                let newPref = prefix + char
                problem1_5(i: newI, prefix: newPref, k: k)
            }
        }
    }
}

//~C(n,n) = (n = 6) = 462
private func problem1_6(i: Int, prefix: String) {
    let newI = i + 1
    if i == alphabet.count + 1 {
        iter += 1
        solution1_6.write(prefix + "\n")
    } else {
        alphabet.forEach { char in
            var isNormal = true
            prefix.forEach { char2 in
                if alphabet.firstIndex(of: String(char2))! > alphabet.firstIndex(of: char)! {
                    isNormal = false
                }
            }
            if isNormal {
                let newPref = prefix + char
                problem1_6(i: newI, prefix: newPref)
            }
        }
    }
}

func Problem1() {
    print("Problem1:")
    solution1_1.open()
    problem1_1(i: 1, prefix: "", k: 5)
    solution1_1.close()
    
    print(iter)
    iter = 0

    solution1_2.open()
    problem1_2(i: 1, prefix: "")
    solution1_2.close()

    print(iter)
    iter = 0
    
    solution1_3.open()
    problem1_3(i: 1, prefix: "", k: 3)
    solution1_3.close()

    print(iter)
    iter = 0
    
    solution1_4.open()
    problem1_4(i: 1, prefix: "")
    solution1_4.close()

    print(iter)
    iter = 0
    
    solution1_5.open()
    problem1_5(i: 1, prefix: "",k: 4)
    solution1_5.close()

    print(iter)
    iter = 0
    
    solution1_6.open()
    problem1_6(i: 1, prefix: "")
    solution1_6.close()

    print(iter)
    iter = 0
}
