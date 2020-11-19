//
//  ContentView.swift
//  RPS WatchKit Extension
//
//  Created by N on 2020/11/18.
//

import SwiftUI

struct ContentView: View {
    @State private var question = "rock"
    @State private var title = "Start!"
    @State private var level = 1
    @State private var currentTime = Date()
    @State private var startTime = Date()
    @State private var gameOver = false
    @State private var isCorrect = ""
    let moves = ["rock", "paper", "scissors"]
    let timer = Timer.publish(every: 1, on: .main, in: .default)
    var time: String {
        let difference = currentTime.timeIntervalSince(startTime)
        return String(Int(difference))
    }
    let solutions = [
        "rock": (win: "paper", lose: "scissors", draw: "rock"),
        "paper": (win: "scissors", lose: "rock", draw: "paper"),
        "scissors": (win: "rock", lose: "paper", draw: "scissors")
    ]
    
    func select(move: String) {
        guard let answer = solutions[question] else {
            fatalError("Unknown question: \(question)")
        }
        
        if move == answer.win {
            isCorrect = "win"
        } else if move == answer.draw {
            isCorrect = "draw"
        } else {
            isCorrect = "lose"
        }
        
        newLevel()
    }
    
    func newLevel() {
        if isCorrect == "win" {
            level += 1
            title = "Win!"
        } else if isCorrect == "draw" {
            title = "Draw On!"
        } else {
            level -= 1
            title = "Lose!"
            if level < 1 { level = 1 }
        }
        
        if level == 21 {
            gameOver = true
            return
        }
        
        question = moves.randomElement()!
    }
    
    var body: some View {
        VStack {
            Text("가위 바위 보!")
                .font(.system(size: 35))
            HStack {
                ForEach(moves, id: \.self) { type in
                    Button {
                        select(move: type)
                    } label: {
                        Image(type)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
       
            HStack {
                Text("\(level)/20")
                Spacer()
                Text("Time: \(time)")
            }
            .padding([.top, .horizontal])
         
            VStack {
                Spacer()
                Spacer()
                if gameOver {
                    Text("You win!")
                        .font(.largeTitle)
                    Text("Your time: \(time) seconds")
                    
                    Button("Play Again") {
                        startTime = Date()
                        gameOver = false
                        title = "Start!"
                        level = 1
                        newLevel()
                    }
                    .buttonStyle(BorderedButtonStyle(tint: .orange))
                } else {
                    Text(title)
                        .font(.system(size: 20))
                }
            }
        }
        .onReceive(timer) { newTime in
            guard gameOver == false else { return }
            currentTime = newTime
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
