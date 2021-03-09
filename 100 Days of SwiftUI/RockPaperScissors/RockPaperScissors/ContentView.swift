//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Vadim Em on 09.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    private let possibleMoves = ["Rock", "Paper", "Scissors"]
    @State private var appChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0

    var body: some View {
        VStack {
            VStack {
                Text("Score: \(score)")
                Text("App's move is: \(possibleMoves[appChoice])")
                Text("You should: \(shouldWin ? "Win" : "Lose")")
            }
            VStack {
                ForEach(possibleMoves) {
                    Button($0) {
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
