//
//  Numbers.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import Foundation

struct Numbers: Identifiable, Comparable, Hashable {
    typealias StringLiteralType = Int
    
    var id: ObjectIdentifier
    var number: Int
    
    static func < (lhs: Numbers, rhs: Numbers) -> Bool {
        return true
    }
    
    enum Digits: Int {
        case zero = 0
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        
    }
    
}


