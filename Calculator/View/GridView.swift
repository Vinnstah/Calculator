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
        LazyVGrid(columns: ButtonsLayout().columns,
                  alignment: .leading) {
            ForEach(ButtonsLayout().buttons, id: \.self) { button in
                Button {
                    
                    /// Need to implement UI better. Right now all buttons toggle when you hit one of the operators. Intended behaviour is to only highlight that specific button. Would work if it's a variable in the enum?
                    switch button {
                    case .plus, .minus, .divide, .multiply:
                        guard viewModel.checkPreviousInput(previousInput: button) == false else {
                            viewModel.saveFirstNumber(firstNum: button);
//                            isButtonPressed.toggle()
                            break
                        }
                    case .equal: viewModel.saveSecondNumber(secondNum: button)
                    case .ac: viewModel.allClear()
                    case .memory: viewModel.saveResults()
                    default: viewModel.receiveInput(calculatorButton: button)
                    }
                } label: {
                    ButtonsView(button: button)
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
