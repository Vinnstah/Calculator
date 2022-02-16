//
//  MainView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var env: SumObject
    
    let buttons: [[Buttons]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .comma, .equal]
    ]
    
    var body: some View {
        
        VStack{
            Spacer()
            HStack {
                Spacer()
                Text(env.display)
                    .font(.system(size: 60))
                    .padding()
                    .foregroundColor(.white)
            }
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button {
                            switch button {
                            case .plus, .minus, .divide, .multiply: env.saveFirstNumber(firstNum: button)
                            case .equal: env.saveSecondNumber(secondNum: button)
                            default: env.receiveInput(calculatorButton: button)
                            }
//                            if button == .plus {
//                            env.saveFirstNumber(firstNum: button)
//                            } else {
//                            env.receiveInput(calculatorButton: button)
//                            }
                        } label: {
                            Text(button.title)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(button: button),
                                       height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
                                .cornerRadius(self.buttonWidth(button: button))
                        }
                        
                    }
                }
                
            }
        }.background(.black)
    }
    
    
    func buttonWidth(button: Buttons) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SumObject())
    }
}
