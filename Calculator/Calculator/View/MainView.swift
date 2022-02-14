//
//  MainView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .padding()
                .foregroundColor(.blue)
            VStack {
                HStack {
                    Number()
                        .padding()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
