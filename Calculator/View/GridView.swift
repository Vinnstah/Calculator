//
//  ButtonsView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-17.
//

import SwiftUI

struct GridView: View {
    
    @EnvironmentObject var env: DisplayAndSummarize
    
    ///This needs to be changed. Would like to add it as a variable for Buttons enum but that doesnt work. Change the enum to struct instead?
    @State var isButtonPressed: Bool = false
    
    var body: some View {
        LazyVGrid(columns: ButtonsLayout().columns,
                  alignment: .leading) {
            ForEach(ButtonsLayout().buttons, id: \.self) { button in
                Button {
                    
                    /// Need to implement UI better. Right now all buttons toggle when you hit one of the operators. Intended behaviour is to only highlight that specific button. Would work if it's a variable in the enum?
                    switch button {
                    case .plus, .minus, .divide, .multiply:
                        guard env.checkPreviousInput(previousInput: button) == false else {
                            env.saveFirstNumber(firstNum: button);
                            isButtonPressed.toggle()
                            break
                        }
                    case .equal: env.saveSecondNumber(secondNum: button)
                    case .ac: env.allClear()
                    case .memory: env.saveResults()
                    default: env.receiveInput(calculatorButton: button)
                    }
                } label: {
                    ButtonsView(button: button, isButtonPressed: isButtonPressed)
                }
            }
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
