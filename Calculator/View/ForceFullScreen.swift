//
//  ForceFullScreen.swift
//  Calculator
//
//  Created by Alexander Cyon on 2022-02-21.
//

import SwiftUI

struct ForceFullScreen<Content>: View where Content: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            content().padding()
        }
    }
}
