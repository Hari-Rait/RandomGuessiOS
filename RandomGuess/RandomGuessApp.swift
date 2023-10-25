//
//  RandomGuessApp.swift
//  RandomGuess
//
//  Created by Hari Rait on 25.10.23.
//

import SwiftUI

@main
struct RandomGuessApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
