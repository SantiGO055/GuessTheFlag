//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Santiago Gonzalez on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Delete selection", action: executeDelete)
        
        
    }
    func executeDelete(){
        print("Now deleting…")
    }
}

#Preview {
    ContentView()
}
