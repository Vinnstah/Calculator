//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: InputGridViewModel())
        }
    }
}
