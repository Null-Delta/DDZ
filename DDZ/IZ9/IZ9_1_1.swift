//
//  IZ9_1_1.swift
//  DDZ
//
//  Created by Rustam Khakhuk on 27.12.2021.
//

import Foundation

private var alphabet = ["a","b","c","d","e","f","g","h","j","k"]

private var solution9_1_1_Empty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_1_Empty.txt"), append: true)!
private var solution9_1_1_NotEmpty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_1_NotEmpty.txt"), append: true)!

private func problem911_Empty(sets: [String], i: Int) {
    
    let newI = i + 1
    
    var emptyCount = 0
    
    sets.forEach { s in
        if s.isEmpty {
            emptyCount += 1
        }
    }
    
    if i == alphabet.count {
        if !isSorted(sets: sets) {
            return
        }
        solution9_1_1_Empty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]\n")
        iter += 1
    } else {
        problem911_Empty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: newI)
    
        problem911_Empty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: newI)
    
        problem911_Empty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: newI)
        
        problem911_Empty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: newI)
        
        problem911_Empty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: newI)
    }
}

private func isSorted(sets: [String]) -> Bool {
    for i in 0..<sets.count {
        for j in i + 1..<sets.count {
            if lenght(s: sets[i]) > lenght(s: sets[j]) {
                return false
            }
        }
    }
    
    return true
}

private func lenght(s: String) -> Int {
    var l = 0
    
    s.forEach{ v in l += Int(powf(2.0,Float(alphabet.firstIndex(of: String(v))!)))}
    return l
}


private func problem911_notEmpty(sets: [String], i: Int) {
    
    let newI = i + 1

    var emptyCount = 0
    
    sets.forEach { s in
        if s.isEmpty {
            solution9_1_1_NotEmpty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]\n")
            emptyCount += 1
        }
    }
    
    if i == alphabet.count {
        if !isSorted(sets: sets) {
            return
        }
        
        iter += 1
    }
    else if alphabet.count - i == emptyCount {
        if sets[0].isEmpty { problem911_notEmpty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: newI) }
    
        if sets[1].isEmpty { problem911_notEmpty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: newI) }
    
        if sets[2].isEmpty { problem911_notEmpty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: newI) }
        
        if sets[3].isEmpty { problem911_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: newI) }
        
        if sets[4].isEmpty { problem911_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: newI) }
        
    } else {
        problem911_notEmpty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: newI)
    
        problem911_notEmpty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: newI)
    
        problem911_notEmpty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: newI)
        
        problem911_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: newI)
        
        problem911_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: newI)
    }
}

func Problem911() {
    print("Problem 9.1.1:")
    solution9_1_1_NotEmpty.open()
    problem911_notEmpty(sets: ["","","","",""], i: 0)
    solution9_1_1_NotEmpty.close()
    
    print(iter)
    iter = 0
    
    solution9_1_1_Empty.open()
    problem911_Empty(sets: ["","","","",""], i: 0)
    solution9_1_1_Empty.close()

    print(iter)
    iter = 0
}
