//
//  MatchMakerGame.swift
//  MatchMaker
//
//  Created by Santhosh K S on 19/03/21.
//

import Foundation

struct MatchMakerGame<CardContent> {
  var cards: Array<Card>
  
  mutating func choose(card: Card) {
    print("card chosen \(card)")
    let chosenIndex: Int  = index(of: card)
    cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    
  }
  
  func index(of card: Card) -> Int {
    for index in 0..<cards.count {
      if cards[index].id == card.id {
        return index
      }
    }
    return 0  // TODO: Bogus!
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
