//
//  ContentView.swift
//  pantallaNiveles
//
//  Created by Bum Soo Jang on 26/09/25.
//

import SwiftUI

struct GameLevelMap: View {
    @State private var unlockedLevel = 5
    @State private var selectedLevel: Int? = nil
    @Environment(\.presentationMode) var presentationMode
    
    let levelColors: [Color] = [
        .red, .orange, .yellow, .green, .blue,
        .purple, .pink, .cyan, .mint, .indigo
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.6, green: 0.8, blue: 0.4),
                        Color(red: 0.4, green: 0.7, blue: 0.3)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                BackgroundElements()
                MapPath()
        
                VStack(spacing: 0) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.orange)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                        .padding(.leading, 20)
                        .padding(.top, 20)
                        
                        Spacer()
                    }
                    
                    GeometryReader { geometry in
                        VStack(spacing: 40) {
                            HStack(spacing: 20) {
                                ForEach(1...4, id: \.self) { level in
                                    NavigationLink(destination: GameScreen(levelNumber: level)) {
                                        LevelNode(
                                            number: level,
                                            isUnlocked: level <= unlockedLevel,
                                            isCurrent: level == unlockedLevel,
                                            color: getLevelColor(level)
                                        )
                                    }
                                }
                            }
                            
                            HStack(spacing: 20) {
                                ForEach([8,7,6,5], id: \.self) { level in
                                    NavigationLink(destination: GameScreen(levelNumber: level)) {
                                        LevelNode(
                                            number: level,
                                            isUnlocked: level <= unlockedLevel,
                                            isCurrent: level == unlockedLevel,
                                            color: getLevelColor(level)
                                        )
                                    }
                                }
                            }
                            
                            HStack(spacing: 20) {
                                NavigationLink(destination: GameScreen(levelNumber: 9)) {
                                    LevelNode(
                                        number: 9,
                                        isUnlocked: 9 <= unlockedLevel,
                                        isCurrent: 9 == unlockedLevel,
                                        color: getLevelColor(9)
                                    )
                                }
                                
                                NavigationLink(destination: GameScreen(levelNumber: 10)) {
                                    LevelNode(
                                        number: 10,
                                        isUnlocked: 10 <= unlockedLevel,
                                        isCurrent: 10 == unlockedLevel,
                                        color: getLevelColor(10)
                                    )
                                }
                                
                                Spacer()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 40)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func getLevelColor(_ level: Int) -> Color {
        let colors: [Color] = [
            .red, .orange, .yellow, .green, .blue,
            .purple, .red, .cyan, .red, .blue
        ]
        return colors[(level - 1) % colors.count]
    }
}

struct LevelNode: View {
    let number: Int
    let isUnlocked: Bool
    let isCurrent: Bool
    let color: Color
    
    @State private var animationScale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(0.2))
                .frame(width: 55, height: 55)
                .offset(x: 2, y: 2)
            
            Circle()
                .fill(isUnlocked ? color : Color.gray)
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                )
                .shadow(radius: isUnlocked ? 5 : 2)
            
            Text("\(number)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            if isCurrent {
                Circle()
                    .stroke(Color.yellow, lineWidth: 4)
                    .frame(width: 65, height: 65)
                    .scaleEffect(animationScale)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .repeatForever(autoreverses: true),
                        value: animationScale
                    )
            }
            
            if !isUnlocked {
                Image(systemName: "lock.fill")
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(y: 15)
            }
        }
        .onAppear {
            if isCurrent {
                animationScale = 1.2
            }
        }
    }
}

struct MapPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 80, y: 150))
            path.addQuadCurve(
                to: CGPoint(x: 160, y: 180),
                control: CGPoint(x: 120, y: 160)
            )
            path.addQuadCurve(
                to: CGPoint(x: 240, y: 220),
                control: CGPoint(x: 200, y: 200)
            )
            path.addQuadCurve(
                to: CGPoint(x: 300, y: 280),
                control: CGPoint(x: 270, y: 250)
            )
            path.addQuadCurve(
                to: CGPoint(x: 280, y: 350),
                control: CGPoint(x: 290, y: 315)
            )
            path.addQuadCurve(
                to: CGPoint(x: 200, y: 390),
                control: CGPoint(x: 240, y: 370)
            )
            path.addQuadCurve(
                to: CGPoint(x: 120, y: 420),
                control: CGPoint(x: 160, y: 405)
            )
            path.addQuadCurve(
                to: CGPoint(x: 80, y: 480),
                control: CGPoint(x: 100, y: 450)
            )
        }
        .stroke(
            LinearGradient(
                colors: [Color.brown.opacity(0.6), Color.yellow.opacity(0.4)],
                startPoint: .leading,
                endPoint: .trailing
            ),
            style: StrokeStyle(lineWidth: 25, lineCap: .round)
        )
        .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
    }
}

struct BackgroundElements: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 300))
                path.addQuadCurve(
                    to: CGPoint(x: 400, y: 350),
                    control: CGPoint(x: 200, y: 320)
                )
            }
            .stroke(
                LinearGradient(
                    colors: [Color.blue.opacity(0.7), Color.cyan.opacity(0.5)],
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                style: StrokeStyle(lineWidth: 40, lineCap: .round)
            )
            
            ForEach(0..<8, id: \.self) { i in
                TreeView()
                    .offset(
                        x: CGFloat.random(in: -180...180),
                        y: CGFloat.random(in: -200...400)
                    )
                    .scaleEffect(CGFloat.random(in: 0.5...1.0))
            }
            
            ForEach(0..<4, id: \.self) { i in
                CloudView()
                    .offset(
                        x: CGFloat.random(in: -150...150),
                        y: CGFloat.random(in: -300...(-100))
                    )
                    .scaleEffect(CGFloat.random(in: 0.6...1.0))
            }
        }
    }
}

struct TreeView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.brown)
                .frame(width: 8, height: 25)
                .offset(y: 12)
            
            Circle()
                .fill(Color.green.opacity(0.8))
                .frame(width: 30, height: 30)
        }
    }
}

struct CloudView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 25, height: 25)
                .offset(x: -10)
            
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 35, height: 35)
            
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 25, height: 25)
                .offset(x: 10)
        }
    }
}

struct GameScreen: View {
    let levelNumber: Int
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var selectedAnswer = ""
    @State private var isCorrectAnswer = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer(minLength: 30)
                    
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.orange)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                        
                        Spacer()
                        
                        Text("Nivel \(levelNumber)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        VStack {
                            Text("🍅")
                                .font(.system(size: 25))
                            Text("🍆")
                                .font(.system(size: 25))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("🍅")
                                .font(.system(size: 25))
                            Text("🍆")
                                .font(.system(size: 25))
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Text("QUIZ DE\nCOMIDA")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Spacer(minLength: 20)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.yellow.opacity(0.8))
                            .frame(width: 200, height: 150)
                        
                        Text("🍔")
                            .font(.system(size: 80))
                    }
                    .padding(.vertical, 10)
                    
                    Text("¿Qué es esto?")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                        .background(Color.green)
                        .cornerRadius(25)
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 15) {
                        HStack(spacing: 20) {
                            Button("Pizza") {
                                answerSelected("Pizza", isCorrect: false)
                            }
                            .buttonStyle(AnswerButtonStyle(color: Color.teal))
                            
                            Button("Hamburguesa") {
                                answerSelected("Hamburguesa", isCorrect: true)
                            }
                            .buttonStyle(AnswerButtonStyle(color: Color.teal))
                        }
                        
                        HStack(spacing: 20) {
                            Button("Ensalada") {
                                answerSelected("Ensalada", isCorrect: false)
                            }
                            .buttonStyle(AnswerButtonStyle(color: Color.green.opacity(0.8)))
                            
                            Button("Taco") {
                                answerSelected("Taco", isCorrect: false)
                            }
                            .buttonStyle(AnswerButtonStyle(color: Color.green.opacity(0.8)))
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 40)
                    
                    HStack {
                        Text("🍕")
                            .font(.system(size: 30))
                        
                        Spacer()
                        
                        Text("🍓")
                            .font(.system(size: 30))
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                }
            }
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            if isCorrectAnswer {
                Button("Siguiente") {
                    loadNextQuestion()
                }
            } else {
                Button("Intentar otra vez") {
                }
            }
        } message: {
            Text(alertMessage)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func answerSelected(_ answer: String, isCorrect: Bool) {
        selectedAnswer = answer
        isCorrectAnswer = isCorrect
        
        if isCorrect {
            alertTitle = "¡Bien hecho!"
            alertMessage = "¡Correcto! 🎉\nEs una hamburguesa."
        } else {
            alertTitle = "¡Inténtalo de nuevo!"
            alertMessage = "¡Incorrecto! 😅\nLa respuesta correcta es Hamburguesa."
        }
        
        showingAlert = true
    }
    
    private func loadNextQuestion() {
        alertTitle = "¡Genial!"
        alertMessage = "Aquí cargarías la siguiente pregunta del quiz."
        showingAlert = true
    }
}

struct AnswerButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 120, height: 50)
            .background(color)
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    GameLevelMap()
}
