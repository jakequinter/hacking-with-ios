//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jake Quinter on 1/17/23.
//

import SwiftUI

enum GameChoice: String {
    case rock, paper, scissors
}

struct ContentView: View {
    let choices: [GameChoice] = [.rock, .paper, .scissors]
    
    @State private var gameChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var currentQuestion = 1
    @State private var isGameOver = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(shouldWin ? "Win" : "Lose") against \(choices[gameChoice].rawValue)")
                .font(.largeTitle.bold())
            
            Spacer()
            
            HStack(spacing: 20) {
                ForEach(choices, id: \.self) { choice in
                    Button(choice.rawValue) {
                        handleClick(choice: choice)
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                }
            }
            
            Spacer()
            Spacer()
            Spacer()
            
            Text("Score: \(score)")
                .font(.title.bold())
            
            Spacer()
        }
        .alert("Game Over!", isPresented: $isGameOver) {
            Button("OK") {
                score = 0
                currentQuestion = 1
                shuffleGame()
            }
        } message: {
            Text("Your final score is \(score)/10")
        }
    }
    
    func handleClick(choice: GameChoice) {
        if choices[gameChoice] == .rock {
            if (shouldWin && choice == .paper) || (!shouldWin && choice != .paper) {
                score += 1
            }
        } else if choices[gameChoice] == .paper {
            if (shouldWin && choice == .scissors) || (!shouldWin && choice != .scissors) {
                score += 1
            }
        } else {
            if (shouldWin && choice == .rock) || (!shouldWin && choice != .rock) {
                score += 1
            }
        }
        
        if currentQuestion == 10 {
            isGameOver = true
        } else {
            currentQuestion += 1
            shuffleGame()
        }
    }
    
    func shuffleGame() {
        gameChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
