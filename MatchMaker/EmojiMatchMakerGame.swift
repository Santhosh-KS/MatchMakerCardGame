//
//  EmojiMatchMakerGame.swift
//  MatchMaker
//
//  Created by Santhosh K S on 19/03/21.
//

import SwiftUI




class EmojiMatchMakerGame {
  
  private var model: MatchMakerGame<String> = EmojiMatchMakerGame.createMatchMakerGame()
  
  static func createMatchMakerGame() -> MatchMakerGame<String> {
    let emojis = ["👻", "💀", "👽"]
    return MatchMakerGame<String>(numberOfParisOfCards: emojis.count ) { pairIndex in
      emojis[pairIndex]
    }
  }
    
  
  // MARK: - Access to the Model
  
  var cards: Array<MatchMakerGame<String>.Card> {
     model.cards
  }
  
  // MARK: Intent(s)
  
  func choose(card: MatchMakerGame<String>.Card) {
    model.choose(card: card)
  }
}
