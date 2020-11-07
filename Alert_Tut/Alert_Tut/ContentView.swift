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
    @State var sliderValue: Double = 0.0
    @State var targetNumber: Int = Int.random(in: 1...100)
    
    
    var body: some View {
        
        VStack {
            Spacer()
            // 1. Target Value
            HStack {
                Text("Get the slider as close as you can to: \(targetNumber)")
            }
            Spacer()
            // 2. Slider
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100, step: 1)
                Text("100")
            }.padding()
            // 3.
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
                
            }.alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Hey There!"), message: Text(
                    "The slider's value is:  \(Int(sliderValue)).\n" +
                    "You scored \(self.pointsForCurrentRound())"
                ), dismissButton: .default(Text("Play Again")))
            }
            Spacer()
            HStack(spacing: 30) {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Text("Score: 99999")
                Text("Round: 2")
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
        }
    }
    
    func pointsForCurrentRound() -> Int {
        
        var roundedValue: Int = Int(self.sliderValue)
        var difference: Int = self.targetNumber - roundedValue
        
        if difference < 0 {
            difference *= -1
        }
        var awarededPoints: Int = 100 - difference
        
        return awarededPoints
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
