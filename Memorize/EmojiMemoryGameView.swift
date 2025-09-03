

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    var emojis: [String] = ["👻","🎓","👌","🦆","🐶",
                            "🐷","🐥","🦉","🐴","🐛"
    ]
    
    @State var cardCount:Int = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
//            Spacer()
//            HStack(spacing: 200) {
//                cardRemover
//                cardAdder
//            }
//            .imageScale(.large)
//            .font(.largeTitle)
        }
    }
    var cards :some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)],spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self){
                index in CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)
                    .padding(4)
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
                Image(systemName: symbol).foregroundStyle(Color.red)
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
//    var content: String = "card"
    let card:MemoryGame<String>.Card
    @State var isFaceUp:Bool = false
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundStyle(Color.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10,2]))
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }.opacity(card.isFaceUp ? 1:0)
            
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
//        .onTapGesture {
//            isFaceUp.toggle()
//        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
