//
//  InputView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import SwiftUI

struct DisplayView: View {
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

//struct DisplayView_Previews: PreviewProvider {
//    static var previews: some View {
//        DisplayView(viewModel: InputGridViewModel())
//    }
//}
