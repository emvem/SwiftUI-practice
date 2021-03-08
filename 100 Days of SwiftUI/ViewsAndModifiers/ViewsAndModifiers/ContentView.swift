//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Vadim Em on 08.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
