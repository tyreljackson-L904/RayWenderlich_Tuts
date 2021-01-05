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

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
        }
    }
}
