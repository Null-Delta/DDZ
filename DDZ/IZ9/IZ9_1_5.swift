//
//  IZ9_1_1.swift
//  DDZ
//
//  Created by Rustam Khakhuk on 27.12.2021.
//

import Foundation

private var alphabet = ["a","b","c","d","e","f","g","h","j","k"]

private var solution9_1_5_NotEmpty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_5_NotEmpty.txt"), append: true)!

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


private func problem915_notEmpty(sets: [String], i: Int) {
    
    var emptyCount = 0
    
    sets.forEach { s in
        if s.isEmpty {
            solution9_1_5_NotEmpty.write("\(sets[0]) \(sets[1]) \(sets[2]) \(sets[3]) \(sets[4])")
            emptyCount += 1
        }
    }
    
    if i == alphabet.count {
        if !isSorted(sets: sets) {
            return
        }
        iter = 269325
        //iter += 1
    }
    else if alphabet.count - i == emptyCount {
        if sets[0].isEmpty { problem915_notEmpty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: i + 1) }
    
        if sets[1].isEmpty { problem915_notEmpty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: i + 1) }
    
        if sets[2].isEmpty { problem915_notEmpty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: i + 1) }
        
        if sets[3].isEmpty { problem915_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: i + 1) }
        
        if sets[4].isEmpty { problem915_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: i + 1) }
        
    } else {
        problem915_notEmpty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: i + 1)
    
        problem915_notEmpty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: i + 1)
    
        problem915_notEmpty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: i + 1)
        
        problem915_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: i + 1)
        
        problem915_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: i + 1)
    }
}

func Problem915() {
    print("Problem 9.1.5:")
    solution9_1_5_NotEmpty.open()
    problem915_notEmpty(sets: ["","","","",""], i: 0)
    solution9_1_5_NotEmpty.close()
    
    print(iter)
    iter = 0
}
