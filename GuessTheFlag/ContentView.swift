//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Santiago Gonzalez on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
                    showingAlert = true
                }
                .alert("Important message", isPresented: $showingAlert) {
                    
                    Button("OK", role: .cancel) { }
                }message: {
                    Text("Please read this.")
                }
    }
    func executeDelete(){
        print("Now deleting…")
    }
}

#Preview {
    ContentView()
}
