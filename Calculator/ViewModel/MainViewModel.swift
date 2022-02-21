//
//  MainViewModel.swift
//  Calculator
//
//  Created by Alexander Cyon on 2022-02-21.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var display: String
    @ObservedObject var calculator: Calculator
    lazy var gridViewModel: GridViewModel = {
        .init(onPress: onPress)
    }()
   
    private let numberFormatter: NumberFormatter
    
    init(
        calculator: Calculator = .init(),
        numberFormatter: NumberFormatter = MainViewModel.defaultNumberFormatter
    ) {
        self.calculator = calculator
        self.display = calculator.digit?.displayValue ?? ""
        self.numberFormatter = numberFormatter
    }
}

extension MainViewModel {
    
    static let defaultNumberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.formatterBehavior = .default
        // TODO: more setup
        return formatter
    }()
    
    var onPress: InputViewModel.OnPress {
        return { [unowned self] input in
            let result = calculator.input(input)
            let nsNumber = NSNumber(value: result)
            self.display = numberFormatter.string(from: nsNumber) ?? "0"
        }
    }
}
