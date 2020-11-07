//
//  ContentView.swift
//  Alert_Tut
//
//  Created by Tyrel Jackson on 11/6/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        
        VStack {
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Knock Knock")
            }.alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Whos There?"), message: Text("your mother"), dismissButton: .default(Text("haha")))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
