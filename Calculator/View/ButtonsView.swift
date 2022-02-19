//
//  Buttons.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-17.
//

import SwiftUI

struct InputView: View {
    
    let input: Input
    
    var body: some View {
        Text(input.displayValue)
            .font(.system(size: 32))
            .frame(width: 100,
                   height: (UIScreen.main.bounds.width - 5 * 12) / 4)
            .foregroundColor(.black)
            .background(.gray)
            .cornerRadius(25)
    }
    
}
