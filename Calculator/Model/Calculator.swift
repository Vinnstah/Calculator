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
    private var operandSavedToMemory: Operand?
    private var newOperand: Operand?
    
    private init(
        value: Operand = 0,
        digits: [Input.Digit] = [],
        lastOperand: Operand? = nil,
        lastBinaryOperator: Input.Operator.BinaryOperator? = nil,
        operandSavedToMemory: Operand? = nil,
        newOperand: Operand? = nil

    ) {
        self.value = value
        self.lastOperand = lastOperand ?? value
        self.digits = digits
        self.lastBinaryOperator = lastBinaryOperator
        self.operandSavedToMemory = operandSavedToMemory ?? value
        self.newOperand = newOperand ?? 0
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
        
        newOperand = operandFromDigits(alsoClearDigits: true) // We know that we finished inputting wanted operand, prepare for entering a new operand
        
        
        func todo() -> Operand {
            print("⚠️ Instruction: '\(instruction)' ignored, not supported.")
            return operandFromDigits()
        }
        
        func updateValueWithResultOfLastBinaryOperator(with lhs: Operand, and rhs: Operand) -> Operand {
            
            guard let lastBinaryOperator = lastBinaryOperator else {
                
                lastOperand = newOperand!
                return newOperand!
            }
            value = lastBinaryOperator.calculate(lhs, rhs)
            lastOperand = value
            return value
            
        }
        
        
        switch instruction {
        case .operator(let `operator`):
            switch `operator` {
            case .equal:

                lastOperand = updateValueWithResultOfLastBinaryOperator(with: lastOperand, and: newOperand!)
                return lastOperand
                
            case .binaryOperator(let binaryOperator):

                    defer {
                        lastBinaryOperator = binaryOperator
                    }
                        
                return updateValueWithResultOfLastBinaryOperator(with: lastOperand, and: newOperand!)
                
            case .unaryOperator(let unaryOperator):
                switch unaryOperator {
                    //Negation not currently functional. Returns the optional default
                case .negation:
                    if operandFromDigits() < 0 {
                        
                        let numberString = digits.map({ String($0.rawValue) }).joined(separator: "")
                        value = abs(Operand(numberString) ?? 2)
                        return value
                    } else {
                        let numberString = digits.map({ String($0.rawValue) }).joined(separator: "")
                        value = Operand(numberString) ?? 0
                        value = -value
                        return value
                        
                    }
                default: return todo()
                }
                
                return todo()
            }
        case .stateChange(let stateChange):
            switch stateChange {
            case .comma:
                return todo()
            case .clear:
                value = 0
                newOperand = 0
                lastOperand = .init()
                lastBinaryOperator = nil
                digits = []
                return 0
            case .saveNumber:
                //Implement function/button to remove operand from memory. Highlight button if there currently is a operand saved to memory
                guard operandSavedToMemory != 0 else {
                    operandSavedToMemory = value
                    print("No operand currently in memory, adding operand to memory: \(String(describing: operandSavedToMemory))")
                    return value
                }
                print("Operand currently in memory: \(String(describing: operandSavedToMemory))")
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
    @discardableResult
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
    
    //    var _newOperand: Operand? {
    //        precondition(isRunningUnitTest())
    //        return newOperand
    //    }
    
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
        //        ,
        //        newOperand: Operand? = nil
    ) -> Calculator {
        precondition(isRunningUnitTest())
        return .init(
            value: value,
            digits: digits,
            lastOperand: lastOperand,
            lastBinaryOperator: lastBinaryOperator
            //            ,
            //            newOperand: newOperand
        )
    }
}

private func isRunningUnitTest() -> Bool {
    NSClassFromString("XCTest") != nil
}
