//
//  Number.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

struct DisplayViewModel {
    @ObservedObject var viewModel: DisplayAndSummarize
    //    let input: Input
    
    func toggleButton(_ input: Input) {
        switch input {
        case Input.instruction(.operand(.plus)),
            Input.instruction(.operand(.minus)),
            Input.instruction(.operand(.divide)),
            Input.instruction(.operand(.multiply)):
            viewModel.firstNumber = viewModel.display
            //            guard viewModel.checkPreviousInput(previousInput: Input.Operand(rawValue: input.displayValue) ?? <#default value#>) == false else {
            //                viewModel.saveFirstNumber(firstNum: input.displayValue);
            //                break
            //            }
            //        case Input.instruction(.operand(.equal)): viewModel.saveSecondNumber(secondNum: viewModel.display)
        case Input.instruction(.stateChange(.clear)): viewModel.allClear()
        case Input.instruction(.stateChange(.saveNumber)): viewModel.saveResults()
        default: viewModel.receiveInput(calculatorButton: input)
        }
    }
}


extension Input.Digit {
    
    var backgroundColor: Color {
        Color(.gray)
    }
    
}

extension Input.Operand {
    
    var backgroundColor: Color {
        switch self {
        case .minus, .plus, .multiply, .divide, .equal:
            return Color(.systemOrange)
        case .negate, .percent:
            return Color(.lightGray)
        }
    }
    
}

extension Input.StateChange {
    
    var backgroundColor: Color {
        switch self {
        case .clear:
            return Color(.lightGray)
        default:
            return Color(.gray)
        }
    }
    
}

struct ButtonLayout {
    let buttons: [Input] 
    let columns : [GridItem]
    
    init() {
        self.columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        self.buttons = [
            Input.instruction(.stateChange(.clear)), Input.instruction(.operand(.negate)), Input.instruction(.operand(.percent)), Input.instruction(.operand(.divide)),
            Input.digit(.seven), Input.digit(.eight), Input.digit(.nine), Input.instruction(.operand(.multiply)),
            Input.digit(.four), Input.digit(.five), Input.digit(.six), Input.instruction(.operand(.minus)),
            Input.digit(.one), Input.digit(.two), Input.digit(.three), Input.instruction(.operand(.plus)),
            Input.instruction(.stateChange(.saveNumber)), Input.digit(.zero), Input.instruction(.stateChange(.comma)), Input.instruction(.operand(.equal))
        ]
    }
}
