//
//  InputView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import SwiftUI

final class GridViewModel: ObservableObject {
    typealias LayoutOrder = [Input]
    
    @Published var inputViewModels: [InputViewModel]
    let columns: [GridItem]
    
    init(
        inputViewModels: [InputViewModel],
        columns: [GridItem]
    ) {
        self.inputViewModels = inputViewModels
        self.columns = columns
    }
}

extension GridViewModel {
    
    convenience init(
        layoutOrder: LayoutOrder = GridViewModel.defaultLayoutOrder,
        columnCount: Int = 4,
        onPress: @escaping InputViewModel.OnPress
    ) {
        self.init(
            inputViewModels: layoutOrder.map {
                InputViewModel(input: $0, onPress: onPress)
            },
            
            columns: .init(
                repeating: .init(.flexible(minimum: InputViewModel.size)),
                count: columnCount
            )
        )
    }
}


extension GridViewModel {
    static let defaultLayoutOrder: LayoutOrder = [
        .instruction(.stateChange(.clear)),
        .instruction(.operator(.unaryOperator(.negation))),
        .instruction(.operator(.unaryOperator(.percent))),
        .instruction(.operator(.binaryOperator(.division))),
        .digit(.seven),
        .digit(.eight),
        .digit(.nine),
        .instruction(.operator(.binaryOperator(.multiplication))),
        .digit(.four),
        .digit(.five),
        .digit(.six),
        .instruction(.operator(.binaryOperator(.subtaction))),
        .digit(.one),
        .digit(.two),
        .digit(.three),
        .instruction(.operator(.binaryOperator(.addition))),
        .instruction(.stateChange(.saveNumber)),
        .digit(.zero),
        .instruction(.stateChange(.comma)),
        .instruction(.operator(.equal))
    ]
}
