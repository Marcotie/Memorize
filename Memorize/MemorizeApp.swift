//
//  MemorizeApp.swift
//  Memorize
//
//  Created by chen marco on 2025/9/1.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
