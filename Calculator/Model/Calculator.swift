//
//  Calculator.swift
//  Calculator
//
//  Created by Alexander Cyon on 2022-02-21.
//

import Foundation

final class Calculator: ObservableObject {
    typealias Operand = Int // TODO: Change to `Float` and support Float numbers...
    
    private var lastOperand: Operand
    private var digits: [Input.Digit] = []
    private var lastBinaryOperator: Input.Operator.BinaryOperator? = nil
    private var value: Operand
    
    private init(
        value: Operand = 0,
        digits: [Input.Digit] = [],
        lastOperand: Operand? = nil,
        lastBinaryOperator: Input.Operator.BinaryOperator? = nil
    ) {
        self.value = value
        self.lastOperand = lastOperand ?? value
        self.digits = digits
        self.lastBinaryOperator = lastBinaryOperator
    }
    
}

extension Calculator {
    convenience init() {
        self.init(
            value: 0
        )
    }
}



private extension Calculator {
    
    func operandFromDigits(alsoClearDigits: Bool = false) -> Operand {
        defer {
            if alsoClearDigits {
                digits = []
            }
        }
        let numberString = digits.map({ String($0.rawValue) }).joined(separator: "")
        return Operand(numberString) ?? 0
    }
    
    func reduce(input: Input) -> Operand {
        
        
        if let digit = input.digit {
            digits.append(digit)
        }
        
        guard
            let instruction = input.instruction
        else {
            //Input was a digit but we do not know yet if we have finished inputting this operand
            return operandFromDigits()
            
        }
        
        let newOperand = operandFromDigits(alsoClearDigits: true) // We know that we finished inputting wanted operand, prepare for entering a new operand
        defer {
            lastOperand = newOperand
        }
        
        func todo() -> Operand {
            print("⚠️ Instruction: '\(instruction)' ignored, not supported.")
            return operandFromDigits()
        }
        
        func updateValueWithResultOfLastBinaryOperator(with lhs: Operand, and rhs: Operand) -> Operand {
            guard let lastBinaryOperator = lastBinaryOperator else {
                return newOperand
            }
            value = lastBinaryOperator.calculate(lhs, rhs)
            return value
            
        }
        
        
        switch instruction {
        case .operator(let `operator`):
            switch `operator` {
            case .equal:

                return updateValueWithResultOfLastBinaryOperator(with: value, and: lastOperand)
                
            case .binaryOperator(let binaryOperator):
                defer {
                    lastBinaryOperator = binaryOperator
                }
                return updateValueWithResultOfLastBinaryOperator(with: lastOperand, and: newOperand)
    
            case .unaryOperator(let unaryOperator):
                return todo()
            }
        case .stateChange(let stateChange):
            switch stateChange {
            case .comma:
                return todo()
            case .clear:
                return todo()
            case .saveNumber:
                return todo()
            }
        }
        
    }
}

private extension Input.Operator.BinaryOperator {
    
    func calculate(
        _ lhs: Calculator.Operand,
        _ rhs: Calculator.Operand
    ) -> Calculator.Operand {
        switch self {
        case .addition:
            return lhs + rhs
        case .subtaction:
            return lhs - rhs
        case .multiplication:
            return lhs * rhs
        case .division:
            print("⚠️ WARNING division rounds!")
            return .init(Float(lhs) / Float(rhs))
        }
    }
}

extension Calculator {
    
    func input(_ input: Input) -> Operand {
        reduce(input: input)
    }
}

// MARK: - Testable
// MARK: -
extension Calculator {
    
    /// Do not call from production code, only from XCTest
    var _value: Operand {
        precondition(isRunningUnitTest())
        return value
    }
    
    /// Do not call from production code, only from XCTest
    var _lastOperand: Operand {
        precondition(isRunningUnitTest())
        return lastOperand
    }
    
    /// Do not call from production code, only from XCTest
    var _digits: [Input.Digit] {
        precondition(isRunningUnitTest())
        return digits
    }
    
    /// Do not call from production code, only from XCTest
    var _lastBinaryOperator: Input.Operator.BinaryOperator? {
        precondition(isRunningUnitTest())
        return lastBinaryOperator
    }
    
    /// Do not call from production code, only from XCTest
    static func _withState(
        value: Operand = 0,
        digits: [Input.Digit] = [],
        lastOperand: Operand? = nil,
        lastBinaryOperator: Input.Operator.BinaryOperator? = nil
    ) -> Calculator {
        precondition(isRunningUnitTest())
        return .init(
            value: value,
            digits: digits,
            lastOperand: lastOperand,
            lastBinaryOperator: lastBinaryOperator
        )
    }
}

private func isRunningUnitTest() -> Bool {
    NSClassFromString("XCTest") != nil
}
