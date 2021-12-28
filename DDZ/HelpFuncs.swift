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

extension Array {
    func appending(_ value: Element) -> Array {
        var newArray = self
        newArray.append(value)
        return newArray
    }
    
    func inserting(_ value: Element, at: Int) -> Array {
        var newArray = self
        newArray.insert(value, at: at)
        return newArray
    }
}

extension OutputStream {

    /// Write `String` to `OutputStream`
    ///
    /// - parameter string:                The `String` to write.
    /// - parameter encoding:              The `String.Encoding` to use when writing the string. This will default to `.utf8`.
    /// - parameter allowLossyConversion:  Whether to permit lossy conversion when writing the string. Defaults to `false`.
    ///
    /// - returns:                         Return total number of bytes written upon success. Return `-1` upon failure.

    func write(_ string: String, encoding: String.Encoding = .utf8, allowLossyConversion: Bool = false) {
        if let data = string.data(using: encoding, allowLossyConversion: allowLossyConversion) {
            data.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) -> Int in
                var pointer = bytes
                var bytesRemaining = data.count
                var totalBytesWritten = 0

                while bytesRemaining > 0 {
                    let bytesWritten = self.write(pointer, maxLength: bytesRemaining)
                    if bytesWritten < 0 {
                        return -1
                    }

                    bytesRemaining -= bytesWritten
                    pointer += bytesWritten
                    totalBytesWritten += bytesWritten
                }

                return totalBytesWritten
            }
        }
    }

}

extension String {
    subscript(i: Int) -> String {
        return String(self[self.index(startIndex, offsetBy: i)..<self.index(startIndex, offsetBy: i + 1)])
    }
    
    subscript(r: Range<Int>) -> String {
        return String(self[self.index(startIndex, offsetBy: r.startIndex)..<self.index(startIndex, offsetBy: r.endIndex)])
    }
    
    func inserting(_ value: String, at: Int) -> String {
        var newString = self
        newString.insert(Character(value), at: newString.index(newString.startIndex, offsetBy: at))
        
        return newString
    }
}
