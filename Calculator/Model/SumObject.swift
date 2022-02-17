//
//  Sum.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-16.
//

import Foundation

class DisplayAndSummarize: ObservableObject {
    @Published var display = ""
    @Published var firstNumber = ""
    @Published var secondNumber = ""
    
    func receiveInput(calculatorButton: Buttons) {
        self.display += calculatorButton.title
    }
    
    func saveFirstNumber(firstNum: Buttons) {
        self.firstNumber = self.display
        self.display = ""
        print("\(self.firstNumber)")
    }
    
    func saveSecondNumber(secondNum: Buttons) {
        self.secondNumber = self.display
        self.display = ""
        print("\(self.secondNumber)")
    }
    
    /// Would this implementation work better?
//    func saveSecondNumber(secondNum: String) -> Int {
//        self.secondNumber = Int(self.display)!
//        return self.secondNumber
//    }
}
