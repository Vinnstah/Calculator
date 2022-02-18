//
//  DisplayAndSaveViewModel.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-18.
//

import Foundation

extension DisplayAndSummarize {
    
    func receiveInput(calculatorButton: Buttons) {
        self.display += calculatorButton.title
    }
    
    func saveFirstNumber(firstNum: Buttons) {
        self.firstNumber = self.display
        self.operatorUsed = firstNum.title
        if self.operatorUsed == "=" { return} else {
            
            self.calculationHistory += " " + self.display + " " + self.operatorUsed}
        
        self.display = ""
    }
    
    /// Currently a bug when you use sum -> the actual sum is added to the calculationHistory too. Need to fix.
    func saveSecondNumber(secondNum: Buttons) {
        self.secondNumber = self.display
        self.calculationHistory += " " + self.display
        switch self.operatorUsed {
        case "/":
            self.display = String(Operators().division(firstNumber: self.firstNumber, secondNumber: self.secondNumber))
        case "+":
            self.display = String(Operators().addition(firstNumber: self.firstNumber, secondNumber: self.secondNumber))
        case "-":
            self.display = String(Operators().subtraction(firstNumber: self.firstNumber, secondNumber: self.secondNumber))
        case "X":
            self.display = String(Operators().multiplication(firstNumber: self.firstNumber, secondNumber: self.secondNumber))
        default:
            print("ERROR")
        }
        self.operatorUsed = secondNum.title
        print("\(operatorUsed)")
    }
    
    func allClear() {
        self.display = ""
        self.firstNumber = ""
        self.secondNumber = ""
        self.operatorUsed = ""
        self.calculationHistory = ""
    }
}
