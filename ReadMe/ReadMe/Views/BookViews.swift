//
//  BookViews.swift
//  ReadMe
//
//  Created by Tyrel Jackson on 1/16/21.
//

import SwiftUI

extension Book {
    struct Image: View {
        var body: some View {
            SwiftUI.Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
        }
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        Book.Image()
    }
}
