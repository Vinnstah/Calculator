//
//  SumViewModel.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-16.
//

import Foundation
import SwiftUI

struct Operators {
//    @ObservedObject var sum: SumObject
//    
//    var body: some View {
//        Button {
//            sum.display = String(division(1, 2))
//        } label: {
//            Text("/")
//            
//        }
//
//        
//    }
    
    func addition(firstNumber: Float, secondNumber: Float) -> Float {
        return (firstNumber + secondNumber)
    }

    func subtraction(firstNumber: Float, secondNumber: Float) -> Float {
        return (firstNumber - secondNumber)
    }

    func multiplication(firstNumber: Float, secondNumber: Float) -> Float {
        return (firstNumber * secondNumber)
    }
    
    func division(_ firstNumber: Int,_ secondNumber: Int) -> Int {
        return (firstNumber / secondNumber)
    }
    
}
