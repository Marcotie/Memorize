//
//  ContentView.swift
//  Memorize
//
//  Created by chen marco on 2025/9/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
           
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View{
    var isFaceUp:Bool = false
    var body: some View{
        ZStack() {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10,2]))
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

#Preview {
    ContentView()
}
