//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/06.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    
    @State private var viewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(viewModel)
        }
    }
}
