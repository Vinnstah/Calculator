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
            GeometryReader { geo in
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    ForEach(viewModel.elements, id: \.self) { input in
                        
                        InputView(viewModel: viewModel).inputViewButton(input: input, geo: geo)
                    }
                }.frame(width: geo.size.width,
                        height: geo.size.height / 3,
                        alignment: .top)
                
            }.padding()
        }
    }
}

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView(viewModel: InputGridViewModel(columns: [GridItem], elements: [Input], display: String))
//    }
//}
