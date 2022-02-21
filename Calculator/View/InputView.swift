//
//  InputView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import SwiftUI

struct InputView: View {
    @ObservedObject var viewModel: InputGridViewModel
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                Text(viewModel.display)
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                    .padding()
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(viewModel: InputGridViewModel())
    }
}
