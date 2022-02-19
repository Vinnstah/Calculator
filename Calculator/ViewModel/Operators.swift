//
//  SumViewModel.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-16.
//

import Foundation
import SwiftUI

struct Operators {
    
    ///Trying to figure out how to avoid force-unwrapping
    func addition(firstNumber: String, secondNumber: String) -> Float {
        guard firstNumber == "" else {
            return (Float(firstNumber)! + Float(secondNumber)!)}
        return 0
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
    
    ///Not finished yet, must be a better way to do it.
    func percent(input: String) -> String {
        let inputFloat = Float(input)
        let result:Float = (inputFloat! / 100)
        return String(result)
    }
    
}

