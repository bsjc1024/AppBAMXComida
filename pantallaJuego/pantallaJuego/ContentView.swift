//
//  ContentView.swift
//  pantallaJuego
//
//  Created by Bum Soo Jang on 24/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var selectedAnswer = ""
    @State private var isCorrectAnswer = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer(minLength: 30)
                    
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
        .background(Color.orange)
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
    }
    
    // MARK: - Functions
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

// MARK: - Custom Button Style
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

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
