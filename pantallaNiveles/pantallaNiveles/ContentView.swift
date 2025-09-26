//
//  ContentView.swift
//  pantallaNiveles
//
//  Created by Bum Soo Jang on 26/09/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: pantallaNivelesDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(pantallaNivelesDocument()))
}
