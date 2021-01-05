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
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .stroke(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
        
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
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
                .kerning(2.0)
                .padding(.bottom, -3)
            ZStack {
                RoundedRectangle(cornerRadius: 21)
                    .stroke(lineWidth: 2)
                    .frame(width: 70, height: 55)
                    .foregroundColor(Color("ButtonStrokeColor"))
                Text(text)
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(title: "Score", text: "0")
            RoundedRectTextView(title: "Round", text: "1")

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
