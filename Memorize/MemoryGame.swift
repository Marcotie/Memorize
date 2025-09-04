//
//  MemorizeGame.swift
//  Memorize
//
//  Created by chen marco on 2025/9/3.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)-> CardContent){
        cards = Array<Card>()
        for index in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(index)
            cards.append(Card( id: "\(index)a", content: content))
            cards.append(Card( id: "\(index)b", content: content))
        }
    }
    var indexOfTheOnlyFaceUpCard: Int?{
        get{
//            var faceUpCardIndices = [Int]()
//            for index in faceUpCardIndices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
            return cards.indices.filter{index in cards[index].isFaceUp}.only
//            let faceUpCardIndices = cards.filter{index in cards[index].isFaceUp}
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set{
            cards.indices.forEach{
                cards[$0].isFaceUp = (newValue == $0)
            }
//            for index in cards.indices{
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                }else{
//                    cards[index].isFaceUp = false
//                }
//            }
        }
    }
    mutating func choose(_ card:Card){
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[choosenIndex].isFaceUp && !cards[choosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOnlyFaceUpCard{
                    if cards[choosenIndex].content == cards[potentialMatchIndex].content{
                        cards[choosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                }else {
                    indexOfTheOnlyFaceUpCard = choosenIndex
                }
                cards[choosenIndex].isFaceUp = true
            }
        }
       

    }
   private func index(of card: Card) -> Int?{
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card:Equatable,Identifiable,CustomDebugStringConvertible{
        var debugDescription: String {
            return "\(id) \(isFaceUp ? "up" : "down") \(content)"
        }
   
        
        var id: String
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
    
}

extension Array{
    var only:Element?{
        count == 1 ? first : nil
    }
}



