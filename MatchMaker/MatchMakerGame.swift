//
//  MatchMakerGame.swift
//  MatchMaker
//
//  Created by Santhosh K S on 19/03/21.
//

import Foundation

struct MatchMakerGame<CardContent> {
  var cards: Array<Card>
  
  func choose(card: Card) {
    print("Hello there! card chosen \(card)")
  }
  
  init(numberOfParisOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    for pairIndex in 0..<numberOfParisOfCards {
      let content = cardContentFactory(pairIndex)
      cards.append(Card(content: content, id: pairIndex*2))
      cards.append(Card(content: content, id: pairIndex*2+1))
    }
  }
  
  struct Card: Identifiable {
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: CardContent
    var id: Int
  }
}
