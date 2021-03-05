//
//  ContentView.swift
//  VolumeConversion
//
//  Created by Vadim Em on 06.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input = ""
    @State private var output = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input", selection: $input, content: {
                        Group {
                            Text("0")
                            Text("1")
                        }
                    })
                    Picker("Output", selection: $input, content: {
                        Text(input)
                    })
                }
                Text("Hello, world!")
            }
            .navigationBarTitle("Volume Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
