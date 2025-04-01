//
//  ListProjectApp.swift
//  ListProject
//
//  Created by Mina Malak on 30/03/2025.
//

import SwiftUI
import SwiftData
import netfox

@main
struct ListProjectApp: App {
    init(){
        #if DEBUG
        NFX.sharedInstance().start()
        #endif
    }
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
