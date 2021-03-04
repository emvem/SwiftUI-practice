//
//  ContentView.swift
//  WeSplit
//
//  Created by Vadim Em on 03.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
        
    var body: some View {
        Button("Tap Count \(tapCount)") {
            self.tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
