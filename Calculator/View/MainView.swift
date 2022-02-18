//
//  MainView.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-14.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
            Spacer()
            DisplayView()
            GridView()
        }.background(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(DisplayAndSummarize())
    }
}
