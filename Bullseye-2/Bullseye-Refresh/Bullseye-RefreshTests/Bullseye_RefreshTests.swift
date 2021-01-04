//
//  Bullseye_RefreshTests.swift
//  Bullseye-RefreshTests
//
//  Created by Tyrel Jackson on 1/4/21.
//

import XCTest
@testable import Bullseye_Refresh

class Bullseye_RefreshTests: XCTestCase {

    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        var guess = game.target + 5
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        var guess = game.target - 5
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}
