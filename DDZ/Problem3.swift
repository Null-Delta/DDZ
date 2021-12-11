//
//  Problem3.swift
//  DDZ
//
//  Created by Rustam Khakhuk on 11.12.2021.
//

import Foundation

private var solution3_1: String = ""
private var solution3_2: String = ""
private var alphabet = ["a","b","c","d","e","f"]

//C(6,1) * C(5,2) * C(5,1) * C(4,1) * C(3,1) = 3600

private func problem3_1(i: Int, k: Int, prefix: String) {
    if i == 5 {
        if k == 1 {
            prefix.forEach { ch in
                solution3_1 += prefix + String(ch) + "\n"
            }
        } else {
            alphabet.forEach { ch in
                if !prefix.contains(ch) {
                    solution3_1 += prefix + ch + "\n"
                }
            }
        }
    } else {
        alphabet.forEach { ch in
            if k == 2 && !prefix.contains(ch) {
                problem3_1(i: i + 1, k: k, prefix: prefix + ch)
            } else if k == 1 {
                problem3_1(i: i + 1, k: k + (prefix.contains(ch) ? 1 : 0), prefix: prefix + ch)
            }
        }
    }
}

//C(6,2) * C(6,2) * C(4,2) * C(4,2) * 2 = 16200

private func problem3_2(i: Int, prefix: String, repeats: [String]) {
    if i == 6 {
        if repeats.count == 1 {
            alphabet.forEach { ch in
                if(prefix.contains(ch) && !repeats.contains(ch)) {
                    solution3_2 += prefix + String(ch) + "\n"
                }
            }
        } else {
            alphabet.forEach { ch in
                if !prefix.contains(ch) {
                    solution3_2 += prefix + ch + "\n"
                }
            }
        }
    } else if i == 5 && repeats.count == 0 {
        prefix.forEach { ch in
            if(!repeats.contains(String(ch))) {
                problem3_2(i: i + 1, prefix: prefix + String(ch), repeats: [String(ch)])
            }
        }
    } else {
        alphabet.forEach { ch in
            if !repeats.contains(ch) {
                if repeats.count < 2 || !prefix.contains(ch) {
                    problem3_2(i: i + 1, prefix: prefix + ch, repeats: prefix.contains(ch) ? repeats.appending(ch) : repeats)
                }
            }
        }
    }
}

func Problem3() {
    problem3_1(i: 1, k: 1, prefix: "")
    
    try! ("total count: \(solution3_1.split(separator: "\n").count)\n" + solution3_1).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution3_1.txt"), atomically: true, encoding: .utf8)
    
    problem3_2(i: 1, prefix: "", repeats: [])
        
    try! ("total count: \(solution3_2.split(separator: "\n").count)\n" + solution3_2).write(to: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution3_2.txt"), atomically: true, encoding: .utf8)
}
