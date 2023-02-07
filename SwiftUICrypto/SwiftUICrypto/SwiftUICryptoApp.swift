//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/06.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}
