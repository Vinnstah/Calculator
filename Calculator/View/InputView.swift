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
            ZStack {
                Rectangle().fill(Color.gray).frame(width: UIScreen.main.bounds.width, height: 40)
                Text(viewModel.display)
                    .foregroundColor(.white)
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(viewModel: InputGridViewModel())
    }
}
