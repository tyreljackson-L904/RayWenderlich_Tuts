//
//  ContentView.swift
//  ReadMe
//
//  Created by Tyrel Jackson on 1/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Book.Image()
            Text("Title")
                .font(.title2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


