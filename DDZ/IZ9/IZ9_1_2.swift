//
//  IZ9_1_1.swift
//  DDZ
//
//  Created by Rustam Khakhuk on 27.12.2021.
//

import Foundation

private var alphabet = ["a","b","c","d","e","f","g","h","j","k"]

private var solution9_1_2_Empty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_2_Empty.txt"), append: true)!
private var solution9_1_2_NotEmpty = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution9_1_2_NotEmpty.txt"), append: true)!

private func problem912_Empty(sets: [[String]], i: Int) {
    var emptyCount = 0
    
    sets.forEach { s in
        if s.isEmpty {
            emptyCount += 1
        }
    }
    
    if i == alphabet.count {
        solution9_1_2_Empty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]\n")
        iter += 1
    } else {
        problem912_Empty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: i + 1)
    
        problem912_Empty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: i + 1)
    
        problem912_Empty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: i + 1)
        
        problem912_Empty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: i + 1)
        
        problem912_Empty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: i + 1)
    }
}


private func problem912_notEmpty(sets: [[String]], i: Int) {
    var emptyCount = 0
    
    sets.forEach { s in
        if s.isEmpty {
            emptyCount += 1
        }
    }
    
    if i == alphabet.count {
        solution9_1_2_NotEmpty.write("[\(sets[0])] [\(sets[1])] [\(sets[2])] [\(sets[3])] [\(sets[4])]\n")
        iter += 1
    }
    else if alphabet.count - i == emptyCount {
        if sets[0].isEmpty { problem912_notEmpty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: i + 1) }
    
        if sets[1].isEmpty { problem912_notEmpty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: i + 1) }
    
        if sets[2].isEmpty { problem912_notEmpty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: i + 1) }
        
        if sets[3].isEmpty { problem912_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: i + 1) }
        
        if sets[4].isEmpty { problem912_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: i + 1) }
        
    } else {
        problem912_notEmpty(sets: [sets[0].appending(alphabet[i]), sets[1], sets[2], sets[3], sets[4]], i: i + 1)
    
        problem912_notEmpty(sets: [sets[0], sets[1].appending(alphabet[i]), sets[2], sets[3], sets[4]], i: i + 1)
    
        problem912_notEmpty(sets: [sets[0], sets[1], sets[2].appending(alphabet[i]), sets[3], sets[4]], i: i + 1)
        
        problem912_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3].appending(alphabet[i]), sets[4]], i: i + 1)
        
        problem912_notEmpty(sets: [sets[0], sets[1], sets[2], sets[3], sets[4].appending(alphabet[i])], i: i + 1)
    }
}

func Problem912() {
    print("Problem 9.1.2:")

    solution9_1_2_NotEmpty.open()
    problem912_notEmpty(sets: [[],[],[],[],[]], i: 0)
    solution9_1_2_NotEmpty.close()

    print(iter)
    iter = 0
    
    solution9_1_2_Empty.open()
    problem912_Empty(sets: [[],[],[],[],[]], i: 0)
    solution9_1_2_Empty.close()

    print(iter)
    iter = 0

}
