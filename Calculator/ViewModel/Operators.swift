//
//  SumViewModel.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-16.
//

import Foundation
import SwiftUI

struct Operators {
    
    func addition(firstNumber: String, secondNumber: String) -> Float {
        return (Float(firstNumber)! + Float(secondNumber)!)
    }
    
    func subtraction(firstNumber: String, secondNumber: String) -> Float {
        return (Float(firstNumber)! - Float(secondNumber)!)
    }
    
    func multiplication(firstNumber: String, secondNumber: String) -> Float {
        return (Float(firstNumber)! * Float(secondNumber)!)
    }
    
    func division(firstNumber: String, secondNumber: String) -> Float {
        return (Float(firstNumber)! / Float(secondNumber)!)
    }
    
}
