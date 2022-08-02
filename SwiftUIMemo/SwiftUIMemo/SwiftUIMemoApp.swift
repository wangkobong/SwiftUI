//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by sungyeon kim on 2022/08/01.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    
    let manager = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, manager.mainContext)
                .environmentObject(manager)
        }
    }
}
