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
    @Published var operatorUsed = ""
    @Published var calculationHistory = ""
}
