//
//  InputViewModel.swift
//  Calculator
//
//  Created by Alexander Cyon on 2022-02-21.
//

import SwiftUI

final class InputViewModel: Hashable, Identifiable, ObservableObject {
    typealias ID = UUID
    typealias OnPress = (Input) -> Void
    private let input: Input
    private let onPress: OnPress
    public let id: ID
    init(input: Input, onPress: @escaping OnPress) {
        self.id = ID()
        self.input = input
        self.onPress = onPress
    }
}

extension InputViewModel {
    
    static let size: CGFloat = 70
    
    var display: String {
        input.displayValue
    }
    func wasPressed() {
        onPress(input)
    }
    
    var backgroundColor: Color {
        switch input {
        case .digit: return Color(.lightGray)
        case .instruction(let instruction):
            switch instruction {
            case .operator(let `operator`):
                switch `operator` {
                case .negate, .percent: return .gray
                default: return Color(.systemOrange)
                }
            case .stateChange:
                return .gray
            }
        }
    }
}

extension InputViewModel {
    static func == (lhs: InputViewModel, rhs: InputViewModel) -> Bool {
    
        guard lhs === rhs else {
            assert(lhs.id != rhs.id)
            return false
        }
        assert(lhs.id == rhs.id)
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
