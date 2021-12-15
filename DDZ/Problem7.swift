//
//  Problem7.swift
//  DDZ
//
//  Created by Rustam Khakhuk on 15.12.2021.
//

// 0 0 0  0 0
// 1 0 0  0 0
// 2 5 0  0 0
// 3 6 8  0 0
// 4 7 9 10 0

import Foundation

private var p = 5
private var q = 5
private var edgeCount = 10

private var solution7_1_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution7_1.txt"), append: true)!
private var solution7_2_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution7_2.txt"), append: true)!



private func generateMatrix(of: String) -> String {
    var offset: Int = 0
    var result = ""
    for i in 0..<p {
        for j in 0..<i {
            result += of[of.index(of.startIndex, offsetBy: (p - 1) * (j) - (j * (j + 1)) / 2 + i - 1 + 10)..<of.index(of.startIndex, offsetBy: (p - 1) * (j) - (j * (j + 1)) / 2 + i + 10)] + " "
        }
        result += "0 "
        
        for j in i + 1..<p {
            result += "\(of[of.index(of.startIndex, offsetBy: j - i - 1 + offset)..<of.index(of.startIndex, offsetBy: j - i - 1 + offset + 1)]) "
        }
        offset += p - i - 1
        result += "\n"
    }
    
    
    return result
}

//C(C(p,2),q) = C(C(5,2),5) = C(10,5) = 2 * 7 * 2 * 9 = 63 * 4 = 252
private func problem7_1(i: Int, k: Int, prefix: String) {
    let newI = i + 1
    let newK = k + 1
    if i == edgeCount + 1 {
        iter += 1
        solution7_1_file.write(generateMatrix(of: prefix + prefix) + "\n")
    } else if (edgeCount - i + 1) - (q - k) == 0 {
        let newPref = prefix + "1"
        problem7_1(i: newI, k: newK, prefix: newPref)
    } else {
        if k < 5 {
            let newPref = prefix + "1"
            problem7_1(i: newI, k: newK, prefix: newPref)
        }
        let newPref = prefix + "0"
        problem7_1(i: newI, k: k, prefix: newPref)
    }
}

//2^(2*C(p,2)) = 2^(2*C(5,2)) = 2^(2*10) = 2^20 = 1048576
private func problem7_2(i: Int, prefix: String) {
    let newI = i + 1
    if i == edgeCount * 2 + 1 {
        iter += 1
        solution7_2_file.write(generateMatrix(of: prefix) + "\n")
    } else {
        let pref1 = prefix + "0"
        let pref2 = prefix + "1"
        problem7_2(i: newI, prefix: pref1)
        problem7_2(i: newI, prefix: pref2)
    }
}

func Problem7() {
    solution7_1_file.open()
    problem7_1(i: 1,k: 0,prefix: "")
    solution7_1_file.close()
    
    print(iter)
    iter = 0
    
    solution7_2_file.open()
    problem7_2(i: 1, prefix: "")
    solution7_2_file.close()
    
    print(iter)
    iter = 0
}
