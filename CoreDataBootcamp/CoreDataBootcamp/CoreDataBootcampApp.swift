//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by sungyeon kim on 2023/01/08.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
