//
//  ContentView.swift
//  pantallaConfiguracion
//
//  Created by Bum Soo Jang on 21/09/25.
//

import SwiftUI

struct ConfigurationScreen: View {
    @State private var soundEnabled = true
    @State private var darkModeEnabled = true
    @State private var languageSelected = "Español"
    @State private var navigateToLevels = false
    
    var body: some View {
        NavigationStack {
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
                            
                            Button(action: {
                                
                            }) {
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
                        navigateToLevels = true
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
                .navigationDestination(isPresented: $navigateToLevels) {
                    GameLevelMap()
                }
            }
        }
    }
}

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
                
                VStack(spacing: 2) {
                    HStack(spacing: 6) {
                        Circle()
                            .fill(Color(.black))
                            .frame(width: 3, height: 3)
                        Circle()
                            .fill(Color(.black))
                            .frame(width: 3, height: 3)
                    }
                    
                    Path { path in
                        path.addArc(center: CGPoint(x: 0, y: 0),
                                    radius: 4,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(180),
                                    clockwise: false)
                    }
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 8, height: 4)
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
            .animation(
                Animation.linear(duration: 4.0)
                    .repeatForever(autoreverses: false),
                value: isRotating
            )
            .onAppear {
                isRotating = true
            }
    }
}

struct AppleIcon: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 40, height: 40)
            
            Ellipse()
                .fill(Color.green)
                .frame(width: 8, height: 15)
                .rotationEffect(.degrees(45))
                .offset(x: 12, y: -12)
            
            VStack(spacing: 3){
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 3, height: 3)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 3, height: 3)
                }
                
                Path { path in
                    path.addArc(center: CGPoint(x: 0, y: 0),
                                radius: 5,
                                startAngle: .degrees(0),
                                endAngle: .degrees(180),
                                clockwise: false)
                }
                .stroke(Color.black, lineWidth: 1)
                .frame(width: 10, height: 5)
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
                    Circle()
                        .fill(Color.white)
                        .frame(width: 26, height: 26)
                        .offset(x: configuration.isOn ? 10: -10)
                        .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct GameLevelMap: View {
    @State private var unlockedLevel = 5
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
                                LevelNode(
                                    number: level,
                                    isUnlocked: level <= unlockedLevel,
                                    isCurrent: level == unlockedLevel,
                                    color: getLevelColor(level)
                                )
                                .onTapGesture {
                                    if level <= unlockedLevel {
                                        print("Playing level \(level)")
                                    }
                                }
                            }
                        }
                        
                        HStack(spacing: 20) {
                            ForEach([8,7,6,5], id: \.self) { level in
                                LevelNode(
                                    number: level,
                                    isUnlocked: level <= unlockedLevel,
                                    isCurrent: level == unlockedLevel,
                                    color: getLevelColor(level)
                                )
                                .onTapGesture {
                                    if level <= unlockedLevel {
                                        print("Playing level \(level)")
                                    }
                                }
                            }
                        }
                        
                        HStack(spacing: 20) {
                            LevelNode(
                                number: 9,
                                isUnlocked: 9 <= unlockedLevel,
                                isCurrent: 9 == unlockedLevel,
                                color: getLevelColor(9)
                            )
                            .onTapGesture {
                                if 9 <= unlockedLevel {
                                    print("Playing level 9")
                                }
                            }
                            
                            LevelNode(
                                number: 10,
                                isUnlocked: 10 <= unlockedLevel,
                                isCurrent: 10 == unlockedLevel,
                                color: getLevelColor(10)
                            )
                            .onTapGesture {
                                if 10 <= unlockedLevel {
                                    print("Playing level 10")
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
            path.addQuadCurve(to: CGPoint(x: 160, y: 180), control: CGPoint(x: 120, y: 160))
            path.addQuadCurve(to: CGPoint(x: 240, y: 220), control: CGPoint(x: 200, y: 200))
            path.addQuadCurve(to: CGPoint(x: 300, y: 280), control: CGPoint(x: 270, y: 250))
            path.addQuadCurve(to: CGPoint(x: 280, y: 350), control: CGPoint(x: 290, y: 315))
            path.addQuadCurve(to: CGPoint(x: 200, y: 390), control: CGPoint(x: 240, y: 370))
            path.addQuadCurve(to: CGPoint(x: 120, y: 420), control: CGPoint(x: 160, y: 405))
            path.addQuadCurve(to: CGPoint(x: 80, y: 480), control: CGPoint(x: 100, y: 450))
        }
        .stroke(LinearGradient(colors: [Color.brown.opacity(0.6), Color.yellow.opacity(0.4)], startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 25, lineCap: .round))
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
            .stroke(LinearGradient(colors: [Color.blue.opacity(0.7), Color.cyan.opacity(0.5)], startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 40, lineCap: .round))
            
            ForEach(0..<8, id: \.self) { i in
                TreeView()
                    .offset(x: CGFloat.random(in: -180...180), y: CGFloat.random(in: -200...400))
                    .scaleEffect(CGFloat.random(in: 0.5...1.0))
            }
            
            ForEach(0..<4, id: \.self) { i in
                CloudView()
                    .offset(x: CGFloat.random(in: -150...150), y: CGFloat.random(in: -300...(-100)))
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

#Preview {
    ConfigurationScreen()
}
