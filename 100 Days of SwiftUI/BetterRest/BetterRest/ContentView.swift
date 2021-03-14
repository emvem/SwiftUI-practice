//
//  ContentView.swift
//  BetterRest
//
//  Created by Vadim Em on 14.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
        Form {
            DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
