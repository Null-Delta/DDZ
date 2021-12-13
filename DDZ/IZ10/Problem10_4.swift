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

private var solution10_4 = ""
private var ranges = [0...8, 9...100-35, 0...7, 11...100-33, 0...6, 12...100-32, 0...5, 12...100-32]

private func getRange(i: Int, sum: Int) -> ClosedRange<Int> {
    let start = ranges[i].first!
    let end = ranges[i].last!
    return start...end
}

private func problem10_4(i: Int, xs: [Int]) {
    if i == 8 {
        var sum = 0
        xs.forEach{ val in sum += val}
        if sum == 100 {
            var result = ""
            xs.forEach{ val in result += "\(val) "}
            print(result)
            solution10_4 += result + "\n"
        }
    } else {
        var sum = 0
        xs.forEach{ val in sum += val}
        
        for j in getRange(i: i, sum: sum) {
            var newArray: [Int] = [Int].init(repeating: 0, count: 8)
            for h in 0..<i { newArray[h] = xs[h] }
            newArray[i] = j
            problem10_4(i: i + 1, xs: newArray)
        }
    }
}

func Problem_IZ_10_4() {
    print("Problem10.4:")

    problem10_4(i: 0, xs: [0,0,0,0,0,0,0,0])
    print(solution10_4.split(separator: "\n").count)
}
