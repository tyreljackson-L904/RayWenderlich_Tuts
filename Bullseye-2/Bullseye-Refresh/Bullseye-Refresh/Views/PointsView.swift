//
//  PointsView.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 1/11/21.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var showAlert: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack {
            InstructionText(text: "The Slider's value is")
                .padding()
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You Scored \(points) Points\n🎉🎉🎉")
            Button(action: {
                withAnimation {
                    showAlert = false
                }
                game.startNewRound(points: points)
            }, label: {
                ButtonText(text: "Start New Round")
            })
                
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var showAlert = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(showAlert: showAlert, sliderValue: sliderValue, game: game)
        PointsView(showAlert: showAlert, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(showAlert: showAlert, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(showAlert: showAlert, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
