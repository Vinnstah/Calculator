//
//  InputModel.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-19.
//

import Foundation
import SwiftUI

protocol Displayable {
    var displayValue: String { get }
}

extension Displayable where Self: RawRepresentable, RawValue == String {
    var displayValue: String {
        rawValue
    }
}

extension CustomStringConvertible where Self: Displayable {
    var description: String {
        displayValue
    }
}

enum Input: Hashable {
    case digit(Digit)
    case instruction(Instruction)
    
    var displayValue: String {
        switch self {
        case .digit(let digit): return digit.displayValue
        case .instruction(let instruction): return instruction.displayValue
        }
    }
    
}

// MARK: - Instruction
// MARK: -
extension Input {
    enum Instruction: Hashable, Displayable {
        case `operator`(Operator)
        case stateChange(StateChange)
        
        var displayValue: String {
            switch self {
            case .operator(let `operator`): return `operator`.displayValue
            case .stateChange(let stateChange): return stateChange.displayValue
            }
        }
        
        var `operator`: Operator? {
            switch self {
            case .`operator`(let `operator`): return `operator`
            case .stateChange: return nil
            }
        }
        
        var stateChange: StateChange? {
            switch self {
            case .`operator`: return nil
            case .stateChange(let stateChange): return stateChange
            }
        }
    }
}

// MARK: - Operator
// MARK: -
extension Input {
    enum Operator: String, Hashable, CustomStringConvertible, Displayable {
        case plus, minus, equal, multiply, divide, negate, percent
    }
    
    enum StateChange: String, Hashable, CustomStringConvertible, Displayable {
        
        /// Inserts a comma, making a presented integer into a presented float.
        case comma
        
        /// Clear or "All Clear", a.k.a. "AC"
        case clear
        
        /// Saves the number, a.k.a. "Memory".
        case saveNumber
    }
}

extension Input.StateChange {
    var displayValue: String {
        switch self {
        case .saveNumber: return "M+"
        case .clear: return "AC"
        case .comma: return Locale.current.decimalSeparator ?? "."
        }
    }
}

extension Input.Operator {
    
    var displayValue: String {
        switch self {
        case .plus: return "+"
        case .minus: return "-"
        case .equal: return "="
        case .multiply: return "X"
        case .divide: return "/"
        case .negate: return "+/-"
        case .percent: return "%"
        }
    }
    
    
}

// MARK: - Digit
// MARK: -
extension Input {
    enum Digit: Int, Hashable, CustomStringConvertible, Displayable {
        case zero, one, two, three, four, five, six, seven, eight, nine
    }
}

// MARK: - Digit Displayable
// MARK: -
extension Input.Digit {
    var displayValue: String {
        String(describing: rawValue)
    }
}

extension Input {
    var digit: Digit? {
        switch self {
        case .digit(let digit): return digit
        case .instruction: return nil
        }
    }
    
    var instruction: Instruction? {
        switch self {
        case .digit: return nil
        case .instruction(let instruction): return instruction
        }
    }
    
    var `operator`: Operator? {
        instruction?.operator
    }
    
    var stateChange: StateChange? {
        instruction?.stateChange
    }
    
    var isDigit: Bool {
        digit != nil
    }
}
