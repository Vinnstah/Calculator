//
//  ButtonsView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-17.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var viewModel: DisplayAndSummarize
    var body: some View {
        LazyVGrid(columns: ButtonLayout().columns,
                  alignment: .leading) {
            ForEach(ButtonLayout().buttons, id: \.self) { button in
                Button {
                    DisplayViewModel(viewModel: viewModel).toggleButton(button)
                    }
                 label: {
                    InputView(input: button)
                }
            }
        }
    }
    
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(viewModel: DisplayAndSummarize())
    }
}
