//
//  GridView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var viewModel: InputGridViewModel
    
    var body: some View {
        VStack {
            Spacer()
            GridViewModel(viewModel: viewModel)
                .padding(.horizontal)
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(viewModel: InputGridViewModel())
    }
}
