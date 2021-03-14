//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Vadim Em on 09.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    enum PossibleMove: String, Comparable {
        case rock
        case paper
        case scissors
        
        static func <(lhs: PossibleMove, rhs: PossibleMove) -> Bool {
            switch rhs {
            case .paper:
                return isPaperWinning(move: lhs)
            case .rock:
                return isRockWinning(move: lhs)
            case .scissors:
                return isScissorsWinning(move: lhs)
            }
        }
        
        static func isRockWinning(move: PossibleMove) -> Bool {
            switch move {
            case .paper:
                return false
            case .rock:
                return false
            case .scissors:
                return true
            }
        }
        
        static func isScissorsWinning(move: PossibleMove) -> Bool {
            switch move {
            case .paper:
                return true
            case .rock:
                return false
            case .scissors:
                return false
            }
        }
        
        static func isPaperWinning(move: PossibleMove) -> Bool {
            switch move {
            case .paper:
                return false
            case .rock:
                return true
            case .scissors:
                return false
            }
        }
        
    }
    
    private let possibleMoves: [PossibleMove] = [.rock, .paper, .scissors]
    @State private var appChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var currentMoves = 0
    
    @State private var showResult: Bool = false

    var body: some View {
        VStack {
            VStack {
                Text("Score: \(score)")
                Text("App's move is: \(possibleMoves[appChoice].rawValue)")
                Text("You should: \(shouldWin ? "Win" : "Lose")")
            }
            VStack {
                ForEach(0..<possibleMoves.count) { index in
                    Button(possibleMoves[index].rawValue) {
                        moveTapped(index)
                    }
                }
            }
        }
        .alert(isPresented: $showResult, content: {
            Alert(title: Text("Text"), message: Text("Message"), dismissButton: .default(Text("continue")) {
                startAgain()
            })
        })
    }
    
    func startAgain() {
        score = 0
        currentMoves = 0
    }
    
    func moveTapped(_ moveIndex: Int) {
        let hasWonByMove = isWinningMove(moveIndex: moveIndex)
        let result = hasWonByMove == shouldWin
        if result {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
                
        appChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()

        currentMoves += 1
        if currentMoves == 10 {
            showResult = true
        }
    }
    
    func isWinningMove(moveIndex: Int) -> Bool {
        return possibleMoves[moveIndex] > possibleMoves[appChoice]
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
