//
//  DisplayView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-17.
//

import SwiftUI

struct DisplayView: View {
    
    @EnvironmentObject var env: DisplayAndSummarize
    var body: some View {
        VStack {
            HStack {
                Text(env.calculationHistory)
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(.white)
            }
            Spacer()
            HStack {
                Spacer()
                Text(env.display)
                    .font(.system(size: 60))
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}
