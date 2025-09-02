//
//  ContentView.swift
//  Memorize
//
//  Created by chen marco on 2025/9/1.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎓","👌","🦆","🐶",
//                            "🐷","🐥","🦉","🐴","🐛"
    ]
    @State var cardCount:Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            HStack(spacing: 200) {
                cardRemover
                cardAdder
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
    }
    var cards :some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){
                index in CardView(content: emojis[index],isFaceUp: true)
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
    func cardCountAdjuster(by offset: Int,symbol:String) -> some View{
        Button(
            action:{
                    cardCount += offset
            },
            label: {
                Image(systemName: symbol)
            }
        ).disabled(cardCount+offset<1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus")
    }
}

struct CardView: View{
    var content: String = "card"
    @State var isFaceUp:Bool = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundStyle(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10,2]))
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1:0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
