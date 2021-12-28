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

private var alphabet = ["a","a","a","a","a","a","a","a","a","a"]

private var solution9_1_4_Empty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_4_Empty.txt"), append: true)!
private var solution9_1_4_NotEmpty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_4_NotEmpty.txt"), append: true)!

private func isSorted(sets: [String]) -> Bool {
    for i in 0..<sets.count {
        for j in i + 1..<sets.count {
            if sets[i].count < sets[j].count {
                return false
            }
        }
    }
    
    return true
}

private func lenght(sets: [String]) -> Int {
    var l = 0
    sets.forEach{ v in l += v.count}
    return l
}

private func problem914_Empty(sets: [String], i: Int) {
    if i == 5 {
        solution9_1_4_Empty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]\n")
        iter += 1
    } else if i == 4 {
        problem914_Empty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4] + String(repeating: "a", count: 10 - lenght(sets: sets))], i: i + 1)
    }else {
        for j in 0...10 - lenght(sets: sets) {
            if i == 0 {
                problem914_Empty(sets: [sets[0] + String(repeating: "a", count: j), sets[1], sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 1 {
                problem914_Empty(sets: [sets[0], sets[1] + String(repeating: "a", count: j), sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 2 {
                problem914_Empty(sets: [sets[0], sets[1], sets[2] + String(repeating: "a", count: j), sets[3], sets[4]], i: i + 1)
            }
            if i == 3 {
                problem914_Empty(sets: [sets[0], sets[1], sets[2], sets[3] + String(repeating: "a", count: j), sets[4]], i: i + 1)
            }
        }
    }
}

private func problem914_notEmpty(sets: [String], i: Int) {
    if i == 5 {
        solution9_1_4_NotEmpty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]\n")
        iter += 1
    } else if i == 4 {
        problem914_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4] + String(repeating: "a", count: 10 - lenght(sets: sets))], i: i + 1)
    }else {
        for j in 0...10 - lenght(sets: sets) {
            if i == 0 {
                problem914_notEmpty(sets: [sets[0] + String(repeating: "a", count: j), sets[1], sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 1 {
                problem914_notEmpty(sets: [sets[0], sets[1] + String(repeating: "a", count: j), sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 2 {
                problem914_notEmpty(sets: [sets[0], sets[1], sets[2] + String(repeating: "a", count: j), sets[3], sets[4]], i: i + 1)
            }
            if i == 3 {
                problem914_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3] + String(repeating: "a", count: j), sets[4]], i: i + 1)
            }
        }
    }
}

func Problem914() {
    print("Problem 9.1.4:")

    solution9_1_4_NotEmpty.open()
    problem914_notEmpty(sets: ["a","a","a","a","a"], i: 0)
    solution9_1_4_NotEmpty.close()

    print(iter)
    iter = 0
    
    solution9_1_4_Empty.open()
    problem914_Empty(sets: ["","","","",""], i: 0)
    solution9_1_4_Empty.close()

    print(iter)
    iter = 0
}
