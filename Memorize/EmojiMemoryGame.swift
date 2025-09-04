//
//  EmojiMemory.swift
//  Memorize
//
//  Created by chen marco on 2025/9/3.
//

import Foundation
import SwiftUI
//
//func createCardContent(index: Int)->String{
//    
////    return arr[index]
//}

class EmojiMemoryGame:ObservableObject{
    
    private static let emojis = ["👻","🎓","👌","🦆","🐶","🐷","🐥","🦉","🐴","🐛"]
    @Published private var model = MemoryGame(numberOfPairsOfCards: 8){
       index in return emojis[index]
    }
    var hello: String?
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        
        model.choose(card)
    }
//    MARK: - intent
  
    func shuffle(){
        model.shuffle()
        print(model.cards)
//        objectWillChange.send()
    }

    
//    private var model = MemoryGame<String>(
//        numberOfPairsOfCards: 4,
//        cardContentFactory: {
//            (index:Int) -> String in return ["a","b"][index]
//        }
//    )
//    private var model2 = createMemoryGame()
//    private static func createMemoryGame()-> MemoryGame<String>{
//        return MemoryGame(numberOfPairsOfCards: 4){
//            index in
//            if emojis.indices.contains(index){
//                return emojis[index]
//            }else{
//                return "⁉️"
//            }
//            
//         }
//    }
   
   
}
