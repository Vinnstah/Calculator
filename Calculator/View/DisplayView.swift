//
//  DisplayView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-17.
//

import SwiftUI

struct DisplayView: View {
    
    @EnvironmentObject var env: SumObject
    var body: some View {
        HStack {
            Spacer()
            Text(env.display)
                .font(.system(size: 60))
                .padding()
                .foregroundColor(.white)
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}
