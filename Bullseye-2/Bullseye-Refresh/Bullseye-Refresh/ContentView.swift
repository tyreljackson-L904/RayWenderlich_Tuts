//
//  ContentView.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 12/21/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert: Bool = false
    @State private var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("89")
                .fontWeight(.black)
                .font(.system(size: 28))
            HStack {
                Text("1")
                    .fontWeight(.bold)
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
                    .fontWeight(.bold)
            }
            Button(action: {
                // do something
                self.showAlert.toggle()
            }, label: {
                Text("HIT ME")
                    .fontWeight(.bold)
            })
            .alert(isPresented: $showAlert) {
                let roundedValue: Int = Int(self.sliderValue)
                
                return Alert(title: Text("Nice One"), message: Text("The slide value is  \(roundedValue)"))
            }
                .frame(width: 125, height: 65)
                .background(Color.blue)
                .cornerRadius(20)
                .foregroundColor(.white)
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
