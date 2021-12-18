//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Frederick Javalera on 12/18/21.
//

import SwiftUI

struct ContentView: View {
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var score = 0
  @State private var showAlert = false
  @State private var attempts = 0
  let totalQuestions = 7
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
  @State private var correctAnswer = Int.random(in: 0...2)
  var body: some View {
    ZStack {
      RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
      ], center: .top, startRadius: 200, endRadius: 400)
        .ignoresSafeArea()
      
      VStack {
        Text("Guess the Flag")
          .font(.largeTitle.weight(.bold))
          .foregroundColor(.white)
        
        VStack(spacing: 15) {
          
          VStack {
            Text("Tap the flag of")
              .font(.subheadline.weight(.heavy))
              .foregroundStyle(.secondary)
            
            Text(countries[correctAnswer])
              .font(.largeTitle.weight(.semibold))
          }
          .foregroundColor(.white)
          
          ForEach(0..<3) { number in
            Button {
              flagTapped(number)
            } label: {
              Image(countries[number])
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
            }
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
        Text("Score: \(score)")
          .foregroundColor(.white)
          .font(.title.bold())
      }
      .padding()
    }
    .ignoresSafeArea()
    .alert(scoreTitle, isPresented: $showingScore) {
      if attempts <= totalQuestions {
        Button("Continue", action: askQuestion)
      } else {
        Button("Start Over", action: reset)
      }
    } message: {
      if attempts <= totalQuestions {
        Text("Your score is \(score)")
      } else {
        Text("Here are your final results. You got \(score) correct, out of \(attempts) questions.")
      }
    }
  }
  
  func flagTapped(_ number: Int) {
    attempts += 1
    if number == correctAnswer {
      scoreTitle = "Correct"
      score += 1
    } else {
      scoreTitle = "Wrong! That's the flag of \(countries[number])"
    }
    
    showingScore = true
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
  
  func reset() {
    scoreTitle = ""
    score = 0
    attempts = 0
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
