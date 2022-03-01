//
//  Input+Operator.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-28.
//

import Foundation

// MARK: - Operator
// MARK: -
extension Input {
    enum Operator: Hashable, CustomStringConvertible, Displayable {
        case binaryOperator(BinaryOperator)
        case unaryOperator(UnaryOperator)
        
        /// Equal is a very special operator, because most calculators should
        /// "cache" the last binary operator (if any) and the last operand (if any)
        /// and perform the operator several times to the result, using the last
        /// operand.
        case equal
        
        enum BinaryOperator: String, CaseIterable, Hashable, CustomStringConvertible, Displayable {
            case addition, subtaction, multiplication, division
        }
        enum UnaryOperator: String, CaseIterable, Hashable, CustomStringConvertible, Displayable {
            case negation, percent
        }
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

extension Input.Operator.BinaryOperator {
    var displayValue: String {
        switch self {
        case .addition: return "+"
        case .subtaction: return "-"
        case .multiplication: return "X"
        case .division: return "/"
        }
    }
}

extension Input.Operator.UnaryOperator {
    var displayValue: String {
        switch self {
        case .percent: return "%"
        case .negation: return "+/-"
        }
    }
}

extension Input.Operator {
    
    var displayValue: String {
        switch self {
        case .equal: return "="
        case .binaryOperator(let binaryOperator):
            return binaryOperator.displayValue
        case .unaryOperator(let unaryOperator):
            return unaryOperator.displayValue
        }
    }
    
    
}
