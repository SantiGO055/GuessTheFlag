//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Santiago Gonzalez on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            /*
             LinearGradient(stops: [
                 .init(color: .white, location: 0.45),
                 .init(color: .black, location: 0.55),
             ], startPoint: .top, endPoint: .bottom)
             
             LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
             
             RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
             
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)*/
            /*Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
             
             Text("Your content")
                 .frame(maxWidth: .infinity, maxHeight: .infinity)
                 .foregroundStyle(.white)
                 .background(.red.gradient)*/
            Button("Delete selection") {
                print("Now deleting…")
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
