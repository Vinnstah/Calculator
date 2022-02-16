//
//  MainView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

struct MainView: View {
    let buttons: [[Buttons]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .equal]
        
    ]
    var body: some View {
        
        VStack{
            Spacer()
            HStack {
                Spacer()
                Text("TEST")
                    .font(.system(size: 45))
                    .padding()
            }
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button {
                            
                        } label: {
                            Text(button.title)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
                                .cornerRadius(self.buttonWidth())
                        }
                        
                    }
                }
                
            }
        }
    }
    

func buttonWidth() -> CGFloat {
    return (UIScreen.main.bounds.width - 5 * 12) / 4
}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
