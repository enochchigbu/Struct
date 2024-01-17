//
//  StructApp.swift
//  Struct
//
//  Created by Enoch Chigbu on 1/6/24.
//

import SwiftUI
let defaults = UserDefaults.standard

@main
struct StructApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            EntryView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
