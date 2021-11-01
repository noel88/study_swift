//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Xiah Lee on 2021/11/01.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {

    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
