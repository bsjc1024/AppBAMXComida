//
//  ContentView.swift
//  pantallaPrincipal
//
//  Created by Bum Soo Jang on 12/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.orange
                    .ignoresSafeArea()
            
                VStack(spacing: 50){
                    VStack(spacing: 100){
                        HStack{
                            Text("🍎")
                            Spacer()
                            Text("🍆")
                        }
                        .font(.system(size: 50))
                        .padding(.horizontal, 40)
                    
                        Text("Adivina\n la\n Comida")
                            .font(.custom("Times New Roman", size: 75))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                
                    Button(action: {
                        print("Boton JUGAR presionado")
                        navigateToLoading = true
                    }) {
                        Text("JUGAR")
                            .font(.custom("Times New Roman", size: 30))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 60)
                            .background(Color.green)
                            .cornerRadius(30)
                    }
                
                    Spacer()
                
                    HStack{
                        Text("🍕")
                        Spacer()
                        Text("🍓")
                    }
                    .font(.system(size: 50))
                    .padding(.horizontal, 40)
                }
            }
            .navigationDestination(isPresented: $navigateToLoading){
                LoadingScreen()
            }
        }
    }
}

struct LoadingScreen: View {
    @State private var progress: Double = 0.0
    @State private var isAnimating: Bool = false
    @State private var navigateToConfiguration: Bool = false
        
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
                
            VStack(spacing: 40) {
                Spacer()
                    
                ZStack {
                    Circle()
                        .fill(Color(red: 0.8, green: 0.6, blue: 0.3))
                        .frame(width: 120, height: 120)
                        
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: 10, y: -5)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: 10, y: -10)
                            
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: 10, y: -10)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: 15, y: -10)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -10, y: 2)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: 1, y: 10)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -30, y: 10)
                        }
                            
                        HStack {
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -5, y: 5)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -5, y: 5)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -5, y: 5)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -5, y: 5)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -5, y: 5)
                                
                            Circle()
                                .fill(Color(red: 0.4, green: 0.2, blue: 0.1))
                                .frame(width: 12, height: 10)
                                .offset(x: -10, y: 10)
                        }
                    }
                        
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 35, height: 35)
                        .offset(x: 35, y: -35)
                }
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(
                    Animation.linear(duration: 2.0)
                        .repeatForever(autoreverses: false),
                    value: isAnimating
                )
                    
                Spacer()
                    
                Text("CARGANDO")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    
                VStack(spacing: 10){
                    ProgressView(value: progress, total: 1.0)
                        .progressViewStyle(CustomProgressViewStyle())
                        .frame(width: 200)
                        
                    Text("\(Int(progress * 100))%")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                }
                    
                Spacer()
            }
            .navigationDestination(isPresented: $navigateToConfiguration) {
                ConfigurationScreen()
            }
        }
        .onAppear {
            isAnimating = true
            startProgressAnimation()
        }
    }
        
    private func startProgressAnimation() {
        withAnimation(.linear(duration: 3.0)) {
            progress = 1.0
        }
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            navigateToConfiguration = true
        }
    }
}

struct CustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.3))
                .frame(height: 8)
                
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.green, .yellow]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 200, height: 8)
                .animation(.easeInOut, value: configuration.fractionCompleted)
        }
    }
}

struct ConfigurationScreen: View {
    var body: some View {
        Text("Pantalla de Configuración")
    }
}

#Preview {
    ContentView()
}
