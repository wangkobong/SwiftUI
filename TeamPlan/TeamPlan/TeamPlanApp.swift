//
//  TeamPlanApp.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/02/05.
//

import SwiftUI

@main
struct TeamPlanApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showLaunchView: Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showLaunchView {
                    LaunchScreenView(showOnboardingView: $showLaunchView)
                        .transition(.move(edge: .leading))
                } else {
                    OnboardingView()
                }
            }
        }
    }
}
