//
//  ContentView.swift
//  VolumeConversion
//
//  Created by Vadim Em on 06.03.2021.
//

import SwiftUI

struct ContentView: View {

    enum Volume: String, CaseIterable, Identifiable {
        case milliliters
        case cups
        case pints
        case litters
        case gallons
        
        var id: String { self.rawValue }
        
        var amountInMilliliters: Double {
            return getAmountInMilliliters(for: self)
        }
        
        var milliliters: String {
            return "\(Int(amountInMilliliters)) ml"
        }
        
        private func getAmountInMilliliters(for volume: Volume) -> Double {
            switch volume {
            case .milliliters:
                return 1
            case .cups:
                return getAmountInMilliliters(for: .milliliters) * 250
            case .pints:
                return getAmountInMilliliters(for: .cups) * 2
            case .litters:
                return getAmountInMilliliters(for: .pints) * 2
            case .gallons:
                return getAmountInMilliliters(for: .litters) * 4
            }
        }
        
    }
    
    @State private var input: Volume = .milliliters
    @State private var output: Volume = .cups
    
    private let volumes: [Volume] = [.milliliters, .litters, .cups, .pints, .gallons]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input/Output selection")) {
                    Picker(input.rawValue, selection: $input, content: {
                        ForEach(volumes) {
                            Text($0.rawValue)
                        }
                    })
                    Picker(output.rawValue, selection: $output, content: {
                        ForEach(volumes) {
                            Text($0.rawValue)
                        }
                    })
                }

                Section(header: Text("Input/Output descrription")) {
                    HStack {
                        Text("\(input.rawValue)")
                        Text("\(input.milliliters)")
                    }
                    HStack {
                        Text("\(output.rawValue)")
                        Text("\(output.milliliters)")
                    }
                }
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
