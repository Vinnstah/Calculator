//
//  Numbers.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import Foundation
import SwiftUI

enum Buttons: String {
    case zero, one, two, three, four, five, six
    case seven, eight, nine, plus, minus, equal
    case multiply, divide, plusMinus, percent, ac, comma, empty
    
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "+"
        case .minus: return "-"
        case .divide: return "/"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .multiply: return "X"
        case .ac: return "AC"
        case .equal: return "="
        case .comma: return "."
        case .empty: return ""
        }
    }
}
