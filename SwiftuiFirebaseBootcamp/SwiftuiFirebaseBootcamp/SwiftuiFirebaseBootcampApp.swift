//
//  SwiftuiFirebaseBootcampApp.swift
//  SwiftuiFirebaseBootcamp
//
//  Created by sungyeon kim on 2023/04/19.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct SwiftuiFirebaseBootcampApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
