//
//  InputView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-21.
//

import SwiftUI

struct InputView {
    
    @ObservedObject var viewModel: InputGridViewModel
    func inputViewButton(input: Input, geo: GeometryProxy) -> some View {
        Button {
            viewModel.display += input.displayValue
        } label: {
            ZStack {
                
                Circle().fill(InputArray().returnBackgroundColor(input: input))
                    .frame(
                        width: geo.size.width / 4,
                        height: geo.size.height / 5
                    )
                
                Text(input.displayValue)
                    .foregroundColor(.white)
                    .font(.system(size: 26).bold()
                          
                    )
            }
        }
    }
}

//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView(viewModel: InputGridViewModel())
//    }
//}
