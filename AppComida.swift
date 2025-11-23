//
//  AppComida.swift
//  
//
//  Created by Bum Soo Jang on 23/11/25.
//

import SwiftUI

// MARK: - App Principal
@main
struct QuizComidaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - Definición de Rutas
enum AppRoute: Hashable {
    case inicio
    case carga
    case configuracion
    case niveles
    case juego(nivel: Int)
}

// MARK: - Content View (Pantalla Principal)
struct ContentView: View {
    @State private var navigationPath: [AppRoute] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            PantallaInicio(navigationPath: $navigationPath)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .inicio:
                        PantallaInicio(navigationPath: $navigationPath)
                    case .carga:
                        PantallaCarga(navigationPath: $navigationPath)
                    case .configuracion:
                        ConfigurationScreen(navigationPath: $navigationPath)
                    case .niveles:
                        GameLevelMap(navigationPath: $navigationPath)
                    case .juego(let nivel):
                        GameScreen(levelNumber: nivel, navigationPath: $navigationPath)
                    }
                }
        }
    }
}

// MARK: - Pantalla Inicio
struct PantallaInicio: View {
    @Binding var navigationPath: [AppRoute]
    
    var body: some View {
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
                
                    Text("Quiz\n de\n Comida")
                        .font(.custom("Times New Roman", size: 75))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
            
                Button(action: {
                    navigationPath.append(.carga)
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
    }
}

// MARK: - Pantalla Carga
struct PantallaCarga: View {
    @State private var progress: Double = 0.0
    @State private var isAnimating: Bool = false
    @Binding var navigationPath: [AppRoute]
    
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
            navigationPath.append(.configuracion)
        }
    }
}

// MARK: - Custom Progress View Style
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

// MARK: - Pantalla Configuración
struct ConfigurationScreen: View {
    @State private var soundEnabled = true
    @State private var darkModeEnabled = true
    @State private var languageSelected = "Español"
    @Binding var navigationPath: [AppRoute]
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    BroccoliIcon()
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    GearIcon()
                        .padding(.trailing, 20)
                }
                .padding(.top, 20)
                
                Text("CONFIGURACIÓN")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                
                VStack(spacing: 30){
                    HStack {
                        Text("Sonido")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Toggle("", isOn: $soundEnabled)
                            .toggleStyle(CustomToggleStyle())
                    }
                    .padding(.horizontal, 40)
                    
                    HStack {
                        Text("Modo Oscuro")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Toggle("", isOn: $darkModeEnabled)
                            .toggleStyle(CustomToggleStyle())
                    }
                    .padding(.horizontal, 40)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Idioma")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        
                        Button(action: {}) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.white)
                                        .frame(width: 30, height: 30)
                                    
                                    Text("A")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                }
                                
                                Text("Español")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.green)
                            )
                        }
                        .padding(.horizontal, 40)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    navigationPath.append(.niveles)
                }) {
                    Text("CONTINUAR")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(15)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
                
                HStack {
                    Spacer()
                    AppleIcon()
                        .padding(.trailing, 40)
                        .padding(.bottom, 20)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Iconos Reutilizables
struct BroccoliIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .fill(Color(red: 0.4, green: 0.7, blue: 0.3))
                .frame(width: 8, height: 20)
                .offset(y: 15)
            
            ZStack {
                Circle()
                    .fill(Color(red: 0.2, green: 0.6, blue: 0.2))
                    .frame(width: 35, height: 35)
                
                VStack {
                    HStack {
                        Circle().fill(Color(red: 0.3, green: 0.7, blue: 0.3)).frame(width: 8, height: 8)
                        Circle().fill(Color(red: 0.3, green: 0.7, blue: 0.3)).frame(width: 6, height: 6)
                        Circle().fill(Color(red: 0.3, green: 0.7, blue: 0.3)).frame(width: 7, height: 7)
                    }
                    HStack {
                        Circle().fill(Color(red: 0.3, green: 0.7, blue: 0.3)).frame(width: 6, height: 6)
                        Circle().fill(Color(red: 0.3, green: 0.7, blue: 0.3)).frame(width: 8, height: 8)
                        Circle().fill(Color(red: 0.3, green: 0.7, blue: 0.3)).frame(width: 6, height: 6)
                    }
                }
            }
        }
        .frame(width: 40, height: 50)
    }
}

struct GearIcon: View {
    @State private var isRotating = false
    
    var body: some View {
        Image(systemName: "gear.circle.fill")
            .font(.system(size: 35))
            .foregroundColor(.yellow)
            .rotationEffect(.degrees(isRotating ? 360 : 0))
            .animation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false), value: isRotating)
            .onAppear { isRotating = true }
    }
}

struct AppleIcon: View {
    var body: some View {
        ZStack {
            Circle().fill(Color.red).frame(width: 40, height: 40)
            Ellipse().fill(Color.green).frame(width: 8, height: 15)
                .rotationEffect(.degrees(45)).offset(x: 12, y: -12)
            VStack(spacing: 3){
                HStack(spacing: 8) {
                    Circle().fill(Color.black).frame(width: 3, height: 3)
                    Circle().fill(Color.black).frame(width: 3, height: 3)
                }
                Path { path in
                    path.addArc(center: CGPoint(x: 0, y: 0), radius: 5,
                                startAngle: .degrees(0), endAngle: .degrees(180), clockwise: false)
                }
                .stroke(Color.black, lineWidth: 1).frame(width: 10, height: 5)
            }
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(configuration.isOn ? Color.green : Color.gray.opacity(0.3))
                .frame(width: 50, height: 30)
                .overlay(
                    Circle().fill(Color.white).frame(width: 26, height: 26)
                        .offset(x: configuration.isOn ? 10: -10)
                        .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
                )
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

// MARK: - Mapa de Niveles
struct GameLevelMap: View {
    @State private var unlockedLevel = 5
    @Binding var navigationPath: [AppRoute]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
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
                        navigationPath.removeLast()
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
                                NavigationLink(value: AppRoute.juego(nivel: level)) {
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
                                NavigationLink(value: AppRoute.juego(nivel: level)) {
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
                            ForEach([9, 10], id: \.self) { level in
                                NavigationLink(value: AppRoute.juego(nivel: level)) {
                                    LevelNode(
                                        number: level,
                                        isUnlocked: level <= unlockedLevel,
                                        isCurrent: level == unlockedLevel,
                                        color: getLevelColor(level)
                                    )
                                }
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
            Circle().fill(Color.black.opacity(0.2)).frame(width: 55, height: 55).offset(x: 2, y: 2)
            
            Circle().fill(isUnlocked ? color : Color.gray).frame(width: 50, height: 50)
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: isUnlocked ? 5 : 2)
            
            Text("\(number)").font(.title2).fontWeight(.bold).foregroundColor(.white)
            
            if isCurrent {
                Circle().stroke(Color.yellow, lineWidth: 4).frame(width: 65, height: 65)
                    .scaleEffect(animationScale)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: animationScale)
            }
            
            if !isUnlocked {
                Image(systemName: "lock.fill").font(.caption).foregroundColor(.white).offset(y: 15)
            }
        }
        .onAppear {
            if isCurrent { animationScale = 1.2 }
        }
    }
}

struct MapPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 80, y: 150))
            path.addQuadCurve(to: CGPoint(x: 160, y: 180), control: CGPoint(x: 120, y: 160))
            path.addQuadCurve(to: CGPoint(x: 240, y: 220), control: CGPoint(x: 200, y: 200))
            path.addQuadCurve(to: CGPoint(x: 300, y: 280), control: CGPoint(x: 270, y: 250))
            path.addQuadCurve(to: CGPoint(x: 280, y: 350), control: CGPoint(x: 290, y: 315))
            path.addQuadCurve(to: CGPoint(x: 200, y: 390), control: CGPoint(x: 240, y: 370))
            path.addQuadCurve(to: CGPoint(x: 120, y: 420), control: CGPoint(x: 160, y: 405))
            path.addQuadCurve(to: CGPoint(x: 80, y: 480), control: CGPoint(x: 100, y: 450))
        }
        .stroke(LinearGradient(colors: [Color.brown.opacity(0.6), Color.yellow.opacity(0.4)],
                               startPoint: .leading, endPoint: .trailing),
                style: StrokeStyle(lineWidth: 25, lineCap: .round))
        .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
    }
}

struct BackgroundElements: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 300))
                path.addQuadCurve(to: CGPoint(x: 400, y: 350), control: CGPoint(x: 200, y: 320))
            }
            .stroke(LinearGradient(colors: [Color.blue.opacity(0.7), Color.cyan.opacity(0.5)],
                                   startPoint: .leading, endPoint: .trailing),
                    style: StrokeStyle(lineWidth: 40, lineCap: .round))
            
            ForEach(0..<8, id: \.self) { _ in
                TreeView().offset(x: CGFloat.random(in: -180...180), y: CGFloat.random(in: -200...400))
                    .scaleEffect(CGFloat.random(in: 0.5...1.0))
            }
            
            ForEach(0..<4, id: \.self) { _ in
                CloudView().offset(x: CGFloat.random(in: -150...150), y: CGFloat.random(in: -300...(-100)))
                    .scaleEffect(CGFloat.random(in: 0.6...1.0))
            }
        }
    }
}

struct TreeView: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color.brown).frame(width: 8, height: 25).offset(y: 12)
            Circle().fill(Color.green.opacity(0.8)).frame(width: 30, height: 30)
        }
    }
}

struct CloudView: View {
    var body: some View {
        ZStack {
            Circle().fill(Color.white.opacity(0.8)).frame(width: 25, height: 25).offset(x: -10)
            Circle().fill(Color.white.opacity(0.8)).frame(width: 35, height: 35)
            Circle().fill(Color.white.opacity(0.8)).frame(width: 25, height: 25).offset(x: 10)
        }
    }
}

// MARK: - Pantalla de Juego
struct GameScreen: View {
    let levelNumber: Int
    @Binding var navigationPath: [AppRoute]
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
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
                            navigationPath.removeLast()
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
                    showingAlert = false
                }
            }
        } message: {
            Text(alertMessage)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func answerSelected(_ answer: String, isCorrect: Bool) {
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
        alertMessage = "¡Siguiente pregunta cargada!"
        showingAlert = true
    }
}

// MARK: - Custom Answer Button Style
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
#Preview {
    ContentView()
}
