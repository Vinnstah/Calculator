//
//  Calculator.swift
//  Calculator
//
//  Created by Alexander Cyon on 2022-02-21.
//

import Foundation

final class Calculator: ObservableObject {
    typealias Operand = Float
    private var inputs: [Input]
    private var lastOperand: Operand?
    
    init(inputs: [Input] = [.digit(.zero)]) {
        self.inputs = inputs
    }
}

extension Calculator {
    func reduce() -> Operand {
        return Operand((inputs.last?.digit ?? .zero).rawValue)

//        guard
//            let instruction =  inputs.last?.instruction
//        else {
//            return // nothing to do
//        }
//
//        switch instruction {
//        case .operator(let `operator`):
////            switch `operator` {
//                fatalError("")
////            }
//        case .stateChange(let stateChange):
//            switch stateChange {
//            case .comma:
//                fatalError("todo")
//
//            case .clear:
//                fatalError("todo")
//
//            case .saveNumber:
//                fatalError("todo")
//            }
//        }
    }
}

extension Calculator {
    var digit: Input.Digit? {
        inputs.last?.digit
    }
    
    func input(_ input: Input) -> Operand {
        inputs.append(input)
        return reduce()
    }
}
