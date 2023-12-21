//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Santiago Gonzalez on 17/12/2023.
//

import SwiftUI

struct FlagImage: View {
    var countries: String

    var body: some View {
        Image(countries)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var resetTitle = ""
    @State private var resetScore = false
    @State private var score = 0
    @State private var countTimesQuestions = 0
    
    var body: some View {
        
        
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.primary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                           flagTapped(number)
                        } label: {
                            FlagImage(countries: countries[number])
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                }
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()

            
            
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            
            .alert(resetTitle, isPresented: $resetScore) {
                Button("OK", action: reset)
            } message: {
                Text("Your score is \(score) . Reset the game")
            }
            
            
        }
    }
    func flagTapped(_ number: Int) {
        
        countTimesQuestions = countTimesQuestions+1
        
       
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            if(score > 0){
                score = score - 1
            }
            else{
                score = 0
            }
            
        }
        if(countTimesQuestions == 8){
            resetScore = true
        }
        else{
            showingScore = true
        }
        
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        countTimesQuestions = 0
        scoreTitle = "Reset game"
        resetScore = true
        
        score = 0
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
