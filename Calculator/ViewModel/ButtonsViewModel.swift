//
//  Number.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI


extension Buttons {
    func buttonWidth(button: Buttons) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

extension Buttons {
    var backgroundColor: Color {
        switch self {
        case .minus, .plus, .multiply, .divide, .equal:
            return Color(.systemOrange)
        case .ac, .plusMinus, .percent, .comma:
            return Color(.lightGray)
        case .empty:
            return Color(.black).opacity(0)
        default:
            return Color(.gray)
        }
    }
}

struct ButtonsLayout {
    
    let buttons: [Buttons]
    let columns : [GridItem]
    
    init() {
        self.buttons =
        [
            .ac, .plusMinus, .percent, .divide,
            .seven, .eight, .nine, .multiply,
            .four, .five, .six, .minus,
            .one, .two, .three, .plus,
            .empty, .zero, .comma, .equal
        ]
        
        self.columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    }
}

