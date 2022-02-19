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
    
    ///This currently works. Need to figure out exactly how to implement everything. Right now it just saves the display to memory. Will need additional variables to paste memory, clear the screen and remove memory. TO BE IMPLEMENTED.
    func saveResults() {
        self.memory = self.display
    }
    
    ///This does not work. Might be better to implement a Bool that sets to true when a operator is being used? Might run into same issue as isButtonnPressed Bool then, so maybe have to convert enum to struct?
    func checkPreviousInput(previousInput: Buttons) -> Bool {
        switch previousInput {
        case .minus, .plus, .multiply, .divide:
            return true
        default: return false
        }
    }
}
