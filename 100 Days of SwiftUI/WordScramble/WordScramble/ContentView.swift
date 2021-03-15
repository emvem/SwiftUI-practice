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
        
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                
            }
        }
        
        return List(people, id: \.self) {
            Text("Hello, world! \($0)")
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
