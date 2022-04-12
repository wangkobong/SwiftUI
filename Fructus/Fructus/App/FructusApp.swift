//
//  FructusApp.swift
//  Fructus
//
//  Created by sungyeon kim on 2022/04/10.
//

import SwiftUI

@main
struct FructusApp: App {
  
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
 
    var body: some Scene {
        WindowGroup {
          if isOnboarding {
            OnboardingView()
          } else {
            ContentView()
          }
        }
    }
}
