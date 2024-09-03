//
//  ContentView.swift
//  Music App
//
//  Created by Shailesh H on 03/04/24.
//

import SwiftUI
import TabBar
import Marquee

struct PlaygroundView: View {
    var body: some View {
        Marquee {
                    Text("Hello World!")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                }
        .marqueeDuration(2)
    }
}



#Preview {
    PlaygroundView()
}

