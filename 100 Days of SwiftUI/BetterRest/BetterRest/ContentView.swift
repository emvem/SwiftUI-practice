//
//  ContentView.swift
//  BetterRest
//
//  Created by Vadim Em on 14.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")
                    .font(.headline)) {
                    DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section(header: Text("Desired amount of sleep")
                    .font(.headline)) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                Section(header: Text("Daily coffee intake")
                    .font(.headline)) {
                    Picker("Daily coffee intake", selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            Text("\($0)")
                        }
                    }
                }
                Section(header: Text("Test")) {
                    Text("Recommended bedtime: \(bedTime)")
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var bedTime: String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return "Your ideal bedtime is: \(formatter.string(from: sleepTime))"
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
