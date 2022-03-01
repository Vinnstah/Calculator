//
//  Input+Instruction.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-28.
//

import Foundation

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
