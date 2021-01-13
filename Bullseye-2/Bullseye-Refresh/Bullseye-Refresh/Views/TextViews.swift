//
//  TextViews.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 1/4/21.
//

import SwiftUI

struct InstructionText: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .fontWeight(.bold)
            .font(.system(size: 14))
            .lineSpacing(4.0)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextView"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .font(.system(size: 28))
            .foregroundColor(Color("TextView"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("TextView"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding()
            .multilineTextAlignment(.center)
            .lineSpacing(12)
            
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("AccentColor"))
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct LabelText: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(size: 14))
            .kerning(2.0)
            
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(1.0)
            .foregroundColor(Color("TextView"))
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(1.0)
            .foregroundColor(Color("TextView"))
            .font(.title3)
    }
}

struct LeaderboardText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextView"))
            .font(.title)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "The Slider's Value is")
                .padding()
            BigNumberText(text: "999")
            BodyText(text: "You Scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText(date: Date())
            LeaderboardText(text: "Leaderboard")
            LabelText(title: "score")
        }
        .padding()
    }
}
