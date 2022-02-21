//
//  InputView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import SwiftUI

final class InputGridViewModel: ObservableObject {
    @Published var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    @Published var buttons: [Input] = ButtonsArray().buttons
    @Published var display: String = ""
//    @Published var isSelected: Bool = false
    
//    init() {
//        self.columns = Array(repeating: .init(.flexible()), count: 4)
//        self.buttons = ButtonsArray().buttons
//        self.display = Input().Digit.displayValue
//
//    }
}

struct GridViewModel: View {
    @ObservedObject var viewModel: InputGridViewModel
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: viewModel.columns, spacing: 5) {
                ForEach(viewModel.buttons, id: \.self) { button in
                    Button {
                        viewModel.display += button.displayValue
                    } label: {
                        ZStack {
                            
                            Circle().fill(ButtonsArray().returnBackgroundColor(input: button))
                                .frame(width: geo.size.width / 4, height: geo.size.height / 5)
                            
                            Text(button.displayValue)
                                .foregroundColor(.white)
                                .font(.system(size: 26).bold()
                                )
                        }
                    }
                }
            }.frame(width: geo.size.width,
                    height: geo.size.height / 3,
                    alignment: .top)
                
        }.padding(.bottom)
    }
}
