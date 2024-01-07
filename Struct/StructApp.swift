//
//  StructApp.swift
//  Struct
//
//  Created by Enoch Chigbu on 1/6/24.
//

import SwiftUI

@main
struct StructApp: App {
    @State private var animationComplete = false
    
    var body: some Scene {
        WindowGroup {
            EntryView()
        }
    }
}
