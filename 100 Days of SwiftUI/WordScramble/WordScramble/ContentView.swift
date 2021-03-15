//
//  ContentView.swift
//  WordScramble
//
//  Created by Vadim Em on 15.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["A", "B", "C"]
    
    var body: some View {
        
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        let input = """
            a
            b
            c
        """
        
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                
            }
        }
        
        return List(letters, id: \.self) {
            Text("Hello, world! \($0.trimmingCharacters(in: .whitespacesAndNewlines))")
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
