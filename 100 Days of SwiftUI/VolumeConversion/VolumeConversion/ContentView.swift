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
    
    @State private var input: Volume = .cups
    @State private var output: Volume = .milliliters
    @State private var amount: String = ""
        
    var conversion: Double {
        input.amountInMilliliters / output.amountInMilliliters
    }
    
    var converionText: String {
        String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input/Output")) {
                    Picker(input.rawValue, selection: $input, content: {
                        ForEach(Volume.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    })
                    Picker(output.rawValue, selection: $output, content: {
                        ForEach(Volume.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    })                    
                }
                
                Section(header: Text("Amount")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Conversion")) {
                    Text("\(1) \(input.rawValue) = \(converionText) \(output.rawValue)")
                }
                
                Section(header: Text("Description")) {
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
