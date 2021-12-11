//
//  HelpFuncs.swift
//  DDZ
//
//  Created by Rustam Khakhuk on 11.12.2021.
//

import Foundation

extension Array {
    func appending(_ value: Element) -> Array {
        var newArray = self
        newArray.append(value)
        return newArray
    }
}
