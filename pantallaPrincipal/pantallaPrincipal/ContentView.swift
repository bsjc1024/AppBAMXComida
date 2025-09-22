//
//  ContentView.swift
//  pantallaPrincipal
//
//  Created by Bum Soo Jang on 12/09/25.
//

import SwiftUI

struct ContentView: View {
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
                    print("Boton JUGAR presionado")
                }) {
                    Text("JUGAR")
                        //.font(.system(size: 30, weight: .bold))
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

#Preview {
    ContentView()
}
