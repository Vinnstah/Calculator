//
//  MainView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: InputGridViewModel
    
    var body: some View {
        VStack {
            Spacer()
            InputView(viewModel: viewModel)
            GridView(viewModel: viewModel)
        }.background(Color(.black))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: InputGridViewModel())
    }
}
