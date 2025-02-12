//
//  ContentView.swift
//  GuessTheFlagSwiftui
//
//

import SwiftUI

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var selectedFlag: Int? = nil
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk" ,"us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 0
    @State private var resetTitle = "Game Over"
    @State private var isGameOver = false
    @State private var selectedCountry = ""
    @State private var shakingFlag: Int? = nil

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Which Flag Represents")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.regular))
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text(countries[correctAnswer].uppercased())
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.heavy))
                        Text("Tap to Choose")
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                        .rotation3DEffect(.degrees(selectedFlag == number ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(selectedFlag == nil || selectedFlag == number ? 1 : 0.25)
                        .scaleEffect(selectedFlag == nil || selectedFlag == number ? 1 : 0.8)
                        .animation(.default, value: selectedFlag)
                        .modifier(Shake(animatableData: shakingFlag == number ? 1 : 0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Your Score is: \(score)")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.heavy))
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Correct" {
                Text("Good Job! Your Score is: \(score)")
            } else {
                Text("Wrong! That Flag is \(selectedCountry)")
            }
        }
        .alert(resetTitle, isPresented: $isGameOver) {
            Button("Reset", action: resetGame)
        } message: {
            Text("Your Score is \(score) out of 8")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 3)) {
                animationAmount += 360
            }
        } else {
            scoreTitle = "Incorrect"
            selectedCountry = countries[number]
            score -= 1
            withAnimation(.default) {
                shakingFlag = number
            }
        }
        
        questionCount += 1
        
        if questionCount == 8 {
            isGameOver = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showingScore = true
            }
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = nil
        shakingFlag = nil
        animationAmount = 0
    }
    
    func resetGame() {
        score = 0
        questionCount = 0
        isGameOver = false
        askQuestion()
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

#Preview {
    ContentView()
}




