//
//  RoundedViews.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 1/5/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextView"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
        
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
        
    }
}

struct RoundedRectTextView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            Text(title.uppercased())
                .font(.system(size: 14))
                .kerning(2.0)
                .padding(.bottom, -3)
            ZStack {
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .stroke(lineWidth: Constants.General.strokeWidth)
                    .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
                    .foregroundColor(Color("ButtonStrokeColor"))
                Text(text)
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextView"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .stroke(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(title: "Score", text: "0")
            RoundedRectTextView(title: "Round", text: "1")
            RoundedTextView(text: "1")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
        
    }
}
