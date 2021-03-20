//
//  ContentView.swift
//  MatchMaker
//
//  Created by Santhosh K S on 17/03/21.
//

import SwiftUI

struct ContentView: View {
  var viewModel: EmojiMatchMakerGame
  
  var body: some View {
    HStack {
      ForEach(viewModel.cards) { card in
        CardView(card: card).onTapGesture {
          viewModel.choose(card: card)
        }
      }
    }
    .padding()
    .foregroundColor(.orange)
    .font(.largeTitle)
    
  }
}

struct CardView: View {
  var card: MatchMakerGame<String>.Card
   
  var body: some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
        Text(card.content)
      } else {
        RoundedRectangle(cornerRadius: 10.0).fill()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(viewModel: EmojiMatchMakerGame())
  }
}


