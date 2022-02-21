//
//  GridView.swift
//  Calculator
//
//  Created by Alexander Cyon on 2022-02-21.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var viewModel: GridViewModel
}

extension GridView {
    var body: some View {
        LazyVGrid(columns: viewModel.columns, spacing: InputViewModel.size/2 + 10) {
            ForEach(viewModel.inputViewModels, id: \.self) { viewModel in
                InputView(viewModel: viewModel)
            }
        }
    }
}
