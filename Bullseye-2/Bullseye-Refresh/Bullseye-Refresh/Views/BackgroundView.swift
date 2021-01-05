//
//  BackgroundView.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 1/5/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            RoundedRectTextView(title: "Score", text: String(game.score))
            Spacer()
            RoundedRectTextView(title: "Round", text: String(game.round))
        }
    }
}

struct LabelTextView: View {
    var title: String
    var text: String
    
    var body: some View {
        Color.gray
            .frame(width: 56, height: 56)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
