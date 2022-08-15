//
//  iDineApp.swift
//  iDine
//
//  Created by sungyeon kim on 2022/08/13.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
