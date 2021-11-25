//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by Shireesh Marla on 25/11/2021.
//

import SwiftUI

@main
struct SwiftUILearningApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
