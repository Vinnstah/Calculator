//
//  Buttons.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-17.
//

import SwiftUI

struct ButtonsView: View {
    let button: Buttons
    var isButtonPressed: Bool
    
    var body: some View {
        Text(button.title)
            .font(.system(size: 32))
            .frame(width: button.buttonWidth(button: button),
                   height: (UIScreen.main.bounds.width - 5 * 12) / 4)
            .foregroundColor(isButtonPressed ? .white : .black)
            .background(isButtonPressed ? button.backgroundColor : .white)
            .cornerRadius(button.buttonWidth(button: button))
    }
}
