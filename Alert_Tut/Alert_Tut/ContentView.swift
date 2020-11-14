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
    @State var userScore = 0
    @State var round = 1
    
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
                Slider(value: $sliderValue, in: 1...100, step: 1)
                Text("100")
            }.padding()
            // 3.
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
            // 4. Alert for score and slider value
            }.alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text(alertTitle()), message: Text(
                    "The slider's value is:  \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound())"
                ), dismissButton: .default(Text("Play Again")) {
                    self.userScore = self.userScore + pointsForCurrentRound()
                    self.targetNumber = Int.random(in: 1...100)
                    self.round = self.round + 1
                })
            }
            Spacer()
            HStack(spacing: 30) {
                Button(action: {
                    self.newGame()
                }) {
                    Text("Start Over")
                }
                Text("Score: \(userScore)")
                Text("Round: \(round)")
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
        }
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(targetNumber - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = abs(targetNumber - sliderValueRounded())
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference <= 10 {
            title = "Not bad"
        } else {
            title = "Are you even trying"
        }
        return title
    }
    
    func newGame() {
        userScore = 0
        round = 1
        targetNumber = Int.random(in: 1...100)
        sliderValue = 50.0
        
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
