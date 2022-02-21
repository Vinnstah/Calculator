//
//  InputView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import SwiftUI

final class InputGridViewModel: ObservableObject {
    @Published var columns: [GridItem]
    @Published var elements: [Input]
    @Published var display: String
    
    init(
        columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4),
        elements: [Input] = InputArray().elements,
        display: String = ""
    ) {
        
        self.columns = columns
        self.elements = elements
        self.display = display
        
    }
}
