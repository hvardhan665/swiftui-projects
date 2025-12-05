//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by ER on 26/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var questionCount = 1
    @State private var showingFinalScore = false
    @State private var FinalScoreTitle = ""
    
    @State private var selectedFlagIndex : Int? = nil
    @State private var isCorrectScore : Bool? = nil
    @State private var animationAmount = 0.0
    @State private var scaleAnimationAmount = 0.0
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag to test your G.K.")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Which one is the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            ZStack {
                                flagImage(image: countries[number])
                                showCorrectColors(color:
                                                    (isCorrectScore == false && correctAnswer != number) ? .red
                                                  : (isCorrectScore == false && correctAnswer == number) ? .green
                                                  : (isCorrectScore == true && selectedFlagIndex == number) ? .green
                                                  : (isCorrectScore == true && selectedFlagIndex != number) ? .red
                                                  : .clear)
                            }
                            
                            .rotation3DEffect(.degrees(selectedFlagIndex == number ? animationAmount : 0),axis: (x: 0, y: 1, z: 0))
                            .opacity((selectedFlagIndex == number || selectedFlagIndex == nil) ? 1 : 0.25)
                            .animation(.easeInOut, value: selectedFlagIndex)
                            .scaleEffect((selectedFlagIndex != number && selectedFlagIndex != nil) ? scaleAnimationAmount : 1)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
            Spacer()
            Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            Spacer()
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
        .alert(FinalScoreTitle, isPresented: $showingFinalScore) {
            Button("Restart", action: resetQuestion)
        } message: {
            Text("Game Over!! Your Final Score Is \(score)")
        }
        
    }
    
    func flagTapped(_ number: Int) {
        selectedFlagIndex = number
        if number == correctAnswer {
            isCorrectScore = true
            scoreTitle = "Correct"
            score += 1
        } else {
            isCorrectScore = false
            scoreTitle = "Wrong"
        }
        animationAmount += 360
        scaleAnimationAmount += 1
        (questionCount >= 8) ? (showingFinalScore = true) : (showingScore = true)
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount += 1
        selectedFlagIndex = nil
        isCorrectScore = nil
        scaleAnimationAmount -= 1
    }
    func resetQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount = 0
        score  = 0
    }
}

#Preview {
    ContentView()
}

struct flagImage : View {
    var image : String
    var body: some View {
        Image(image)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct showCorrectColors : View {
    var color : UIColor
    var body: some View {
        Color(color).opacity(0.25)
            .clipShape(.capsule)
    }
}

struct Title : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
extension View {
    func titleStyle()-> some View {
        modifier(Title())
    }
}
