//
//  RandomGuessApp.swift
//  RandomGuess
//
//  Created by Hari Rait on 25.10.23.
//

import SwiftUI

@main
struct RandomGuessApp: App {
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                ContentView()
                    .tabItem {
                        Label("RandomGuess", systemImage: "wand.and.stars")
                    }
                Text("Wheel Spin")
                    .tabItem {
                        Label("Drehrad", systemImage: "soccerball")
                    }
            }
        }
    }
}
