//
//  pantallaNivelesApp.swift
//  pantallaNiveles
//
//  Created by Bum Soo Jang on 26/09/25.
//

import SwiftUI

@main
struct pantallaNivelesApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: pantallaNivelesDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
