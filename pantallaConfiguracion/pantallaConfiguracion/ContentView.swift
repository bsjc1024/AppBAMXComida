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
                
                HStack {
                    Spacer()
                    AppleIcon()
                        .padding(.trailing, 40)
                        .padding(.bottom, 40)
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

struct ContentView: View {
    var body: some View {
        ConfigurationScreen()
    }
}

#Preview {
    ConfigurationScreen()
}
