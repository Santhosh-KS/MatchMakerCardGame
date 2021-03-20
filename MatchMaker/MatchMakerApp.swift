//
//  MatchMakerApp.swift
//  MatchMaker
//
//  Created by Santhosh K S on 17/03/21.
//

import SwiftUI

@main
struct MatchMakerApp: App {
  let game = EmojiMatchMakerGame()
  var body: some Scene {
    WindowGroup {
      return MatchMakerGameView(viewModel: game)
    }
  }
}
