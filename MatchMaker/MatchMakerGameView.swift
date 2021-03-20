//
//  MatchMakerGameView.swift
//  MatchMaker
//
//  Created by Santhosh K S on 17/03/21.
//

import SwiftUI

struct MatchMakerGameView: View {
  @ObservedObject var viewModel: EmojiMatchMakerGame
  
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
    
    
  }
}

struct CardView: View {
  var card: MatchMakerGame<String>.Card
   
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        if card.isFaceUp {
          RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
          RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
          Text(card.content)
        } else {
          RoundedRectangle(cornerRadius: cornerRadius).fill()
        }
      }
      .font(Font.system(size: fontSize(for: geometry.size)))
    }
  }
  
  func fontSize(for size:CGSize) -> CGFloat {
    min(size.width, size.height) * fontScaleFactor
  }
  
  let cornerRadius: CGFloat = 10.0
  let edgeLineWidth: CGFloat = 3.0
  let fontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MatchMakerGameView(viewModel: EmojiMatchMakerGame())
  }
}


