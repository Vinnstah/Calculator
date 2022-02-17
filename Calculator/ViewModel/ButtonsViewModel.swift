//
//  Number.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI


extension Buttons {
    
    func buttonWidth(button: Buttons) -> CGFloat {
//        func buttonWidth(button: Buttons) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
}
///Not sure how to implement yet
///
//struct ButtonsVM {
//
//    let buttons: [[Buttons]] = [
//        [.ac, .plusMinus, .percent, .divide],
//        [.seven, .eight, .nine, .multiply],
//        [.four, .five, .six, .minus],
//        [.one, .two, .three, .plus],
//        [.zero, .comma, .equal]
//    ]
//}
