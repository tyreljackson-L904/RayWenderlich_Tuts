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
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    @State var leaderBoardIsShowing = false
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }, label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            })
            Spacer()
            Button(action: {
                leaderBoardIsShowing = true
            }, label: {
                RoundedImageViewFilled(systemName: "list.dash")
            }).sheet(isPresented: $leaderBoardIsShowing, content: {
                LeaderBoardView(leaderBoardIsShowing: $leaderBoardIsShowing, game: $game)
            })
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

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
