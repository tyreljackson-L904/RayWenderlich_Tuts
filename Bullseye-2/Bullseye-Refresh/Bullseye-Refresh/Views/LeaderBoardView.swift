//
//  LeaderBoardView.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 1/11/21.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
            VStack(spacing: 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { row in
                            let leaderboardEntry = game.leaderboardEntries[row]
                            RowView(index: row, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(RoundedRectangle(cornerRadius: .infinity).strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(width: Constants.Leaderboard.leaderboardMaxRowWidth)
        
    }
}

struct HeaderView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    LeaderboardText(text: "Leaderboard")
                        .padding(.leading, 60)
                    Spacer()
                } else {
                    LeaderboardText(text: "Leaderboard")

                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderBoardIsShowing = false
                }, label: {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing, 20)
                })
                .padding()
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(title: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            LabelText(title: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(width: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
