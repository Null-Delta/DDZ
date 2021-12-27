//
//  IZ9_1_4.swift
//  DDZ
//
//  Created by Rustam Khakhuk on 27.12.2021.
//

import Foundation

private var alphabet = ["a","a","a","a","a","a","a","a","a","a"]

private var solution9_1_3_Empty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_3_Empty.txt"), append: true)!
private var solution9_1_3_NotEmpty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_3_NotEmpty.txt"), append: true)!

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

private func problem913_Empty(sets: [String], i: Int) {
    if !isSorted(sets: sets) {
        return
    }
    
    if i == 5 {
        solution9_1_3_Empty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]")
        iter += 1
    } else if i == 4 {
        problem913_Empty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4] + String(repeating: "a", count: 10 - lenght(sets: sets))], i: i + 1)
    }else {
        for j in 0...10 - lenght(sets: sets) {
            if i == 0 {
                problem913_Empty(sets: [sets[0] + String(repeating: "a", count: j), sets[1], sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 1 {
                problem913_Empty(sets: [sets[0], sets[1] + String(repeating: "a", count: j), sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 2 {
                problem913_Empty(sets: [sets[0], sets[1], sets[2] + String(repeating: "a", count: j), sets[3], sets[4]], i: i + 1)
            }
            if i == 3 {
                problem913_Empty(sets: [sets[0], sets[1], sets[2], sets[3] + String(repeating: "a", count: j), sets[4]], i: i + 1)
            }
        }
    }
}

private func problem913_notEmpty(sets: [String], i: Int) {
    if !isSorted(sets: sets) {
        return
    }
    
    if i == 5 {
        solution9_1_3_NotEmpty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]")
        iter += 1
    } else if i == 4 {
        problem913_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4] + String(repeating: "a", count: 10 - lenght(sets: sets))], i: i + 1)
    }else {
        for j in 0...10 - lenght(sets: sets) {
            if i == 0 {
                problem913_notEmpty(sets: [sets[0] + String(repeating: "a", count: j), sets[1], sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 1 {
                problem913_notEmpty(sets: [sets[0], sets[1] + String(repeating: "a", count: j), sets[2], sets[3], sets[4]], i: i + 1)
            }
            if i == 2 {
                problem913_notEmpty(sets: [sets[0], sets[1], sets[2] + String(repeating: "a", count: j), sets[3], sets[4]], i: i + 1)
            }
            if i == 3 {
                problem913_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3] + String(repeating: "a", count: j), sets[4]], i: i + 1)
            }
        }
    }
}

func Problem913() {
    solution9_1_3_NotEmpty.open()
    problem913_notEmpty(sets: ["a","a","a","a","a"], i: 0)
    solution9_1_3_NotEmpty.close()

    print(iter)
    iter = 0
    
    solution9_1_3_Empty.open()
    problem913_Empty(sets: ["","","","",""], i: 0)
    solution9_1_3_Empty.close()

    print(iter)
    iter = 0
}
