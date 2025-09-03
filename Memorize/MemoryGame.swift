//
//  MemorizeGame.swift
//  Memorize
//
//  Created by chen marco on 2025/9/3.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)-> CardContent){
        cards = Array<Card>()
        for index in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(index)
            cards.append(Card(content: content))
        }
    }
    func choose(_ card:Card){
        
    }
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }

}



