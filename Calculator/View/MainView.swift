//
//  MainView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
}

extension MainView {
    var body: some View {
        ForceFullScreen {
            VStack(alignment: .trailing) {
                Spacer()
                display
                inputs
                Spacer()
            }
        }
    }
}

private extension MainView {
    @ViewBuilder
    var display: some View {
        Text(viewModel.display)
            .font(.system(size: 80, weight: .semibold))
            .foregroundColor(Color.white)
            .padding([.leading, .bottom], 0)
            .padding([.trailing], InputViewModel.size / 2)
    }
    
    @ViewBuilder
    var inputs: some View {
        GridView(viewModel: viewModel.gridViewModel)
            .padding()
    }
}
