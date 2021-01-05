//
//  ContentView.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 12/21/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var sliderValue = 50.0
    
    // create new instance of Game model
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                InstructionsView(game: $game)
                
                SliderView(sliderValue: $sliderValue)
                
                HitMeButtonView(showAlert: $showAlert, sliderValue: $sliderValue, game: $game)
            }
            .padding()
            .padding(.vertical)
        }
        
    }
}

// view for instructions
struct InstructionsView: View {
    
    @Binding var game: Game
    
    var body: some View {
        
        VStack {
            InstructionText(text: "Put the bullseye as close as you can to")
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.bottom)
            BigNumberText(text: String(game.target))
        }
    }
}

// view for slider
struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1...100)
            SliderLabelText(text: "100")
        }
        .padding(.bottom)
    }
}

// view for hit me button
struct HitMeButtonView: View {
    @Binding var showAlert: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            // do something
            showAlert.toggle()
        }, label: {
            Text("HIT ME")
                .fontWeight(.bold)
                .font(.title3)
                .frame(width: 125, height: 65)
                .background(
                    
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                })
                .cornerRadius(20)
                .foregroundColor(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 21.0)
                        .stroke(Color.white, lineWidth: 2.0)
                )
        })
        .alert(isPresented: $showAlert) {
            let roundedValue: Int = Int(sliderValue.rounded())
            
            return Alert(title: Text("Nice One"), message: Text("The slide value is  \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round"))
        }
    }
}

// light/dark mode, vertical/horizontal layout
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
