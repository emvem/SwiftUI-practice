//
//  ContentView.swift
//  WeSplit
//
//  Created by Vadim Em on 03.03.2021.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var seletedStudent = "Harry"
    
    var body: some View {
        Picker("Select your student", selection: $seletedStudent) {
            ForEach(0..<students.count) {
                Text(self.students[$0])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
