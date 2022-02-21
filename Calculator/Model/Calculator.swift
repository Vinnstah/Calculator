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
    private var lastOperator: Input.Operator? = nil
    
    init(
        value: Operand = 0,
        digits: [Input.Digit] = [],
        lastOperator: Input.Operator? = nil
    ) {
        self.lastOperand = value
        self.digits = digits
        self.lastOperator = lastOperator
    }
}

extension Calculator {
    func reduce(input: Input) -> Operand {
        func numberFromCurrentDigits() -> Operand {
            let numberString = digits.map({ String($0.rawValue) }).joined(separator: "")
            return Operand(numberString) ?? 0
        }
        
        if let digit = input.digit {
            self.digits.append(digit)
        }
        
        guard
            let instruction = input.instruction
        else {
            let number = numberFromCurrentDigits()
            lastOperand = number
            return number
        }
        
        func todo() -> Operand {
            print("⚠️ Instruction: '\(instruction)' ignored, not supported.")
            return numberFromCurrentDigits()
        }
        

        switch instruction {
        case .operator(let `operator`):
            switch `operator` {
            case .equal:
                return todo()
            case .plus:
                return todo()
            case .minus:
                return todo()
            case .divide:
                return todo()
            case .multiply:
                return todo()
            case .negate:
                return todo()
            case .percent:
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

extension Calculator {
    
    func input(_ input: Input) -> Operand {
        reduce(input: input)
    }
}
