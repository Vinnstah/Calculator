//
//  InputView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import SwiftUI

struct InputView: View {
    @ObservedObject var viewModel: InputViewModel
}

extension InputView {
    var body: some View {
        Button(action: {
            viewModel.wasPressed()
        }, label: {
            Text(viewModel.display)
                .font(.title)
                .background(
                    Circle()
                        .fill(viewModel.backgroundColor)
                        .frame(width: InputViewModel.size, height: InputViewModel.size, alignment: .center)
                        
                )
        })
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(viewModel: .init(input: .digit(.eight), onPress: { _ in }))
    }
}
