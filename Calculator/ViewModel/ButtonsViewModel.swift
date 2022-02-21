//
//  ButtonsViewModel.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-21.
//

import Foundation
import SwiftUI

extension InputArray {
    
    func returnBackgroundColor(input: Input) -> Color {
        switch input {
        case .digit: return Color(.lightGray)
        case .instruction(.stateChange(Input.StateChange.comma)): return Color(.gray)
        case .instruction(.stateChange(Input.StateChange.saveNumber)): return Color(.gray)
        case .instruction(.stateChange(Input.StateChange.clear)): return Color(.gray)
        case .instruction(.operand(Input.Operand.equal)): return Color(.systemOrange)
        case .instruction(.operand(Input.Operand.plus)): return Color(.systemOrange)
        case .instruction(.operand(Input.Operand.minus)): return Color(.systemOrange)
        case .instruction(.operand(Input.Operand.negate)): return Color(.gray)
        case .instruction(.operand(Input.Operand.percent)): return Color(.gray)
        case .instruction(.operand(Input.Operand.multiply)): return Color(.systemOrange)
        case .instruction(.operand(Input.Operand.divide)): return Color(.systemOrange)
            
        }
    }
}

/// Should this be implemented in the ButtonsArray or the Input enum?
//extension ButtonsArray {
//    func isButtonSelected(input: Input) -> Bool {
//        if input == true {
//            return true
//        }
//        return false
//    }
//}
