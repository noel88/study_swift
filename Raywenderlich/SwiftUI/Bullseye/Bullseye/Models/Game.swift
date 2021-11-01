//
//  Game.swift
//  Bullseye
//
//  Created by Xiah Lee on 2021/11/01.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        let difference: Int = abs(self.target - sliderValue)
        let awardedPoint: Int = 100 - difference
        return awardedPoint
    }
}
