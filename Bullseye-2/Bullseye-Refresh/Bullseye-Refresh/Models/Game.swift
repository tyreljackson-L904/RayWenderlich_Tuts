//
//  Game.swift
//  Bullseye-Refresh
//
//  Created by Tyrel Jackson on 1/3/21.
//

import Foundation

struct Game {
    
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    //method to calculate slider value and points
    func points(sliderValue: Int) -> Int {
        let difference = abs(self.target - sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2{
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    //method to start a new round of the game
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
}
