//
//  Buttons.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-17.
//

import SwiftUI

struct ButtonsView: View {
    let button: Buttons

    var body: some View {
        Text(button.title)
            .font(.system(size: 32))
            .frame(width: button.buttonWidth(button: button),
                   height: (UIScreen.main.bounds.width - 5 * 12) / 4)
            .foregroundColor(.white)
            .background(button.backgroundColor)
            .cornerRadius(button.buttonWidth(button: button))
    }
}
