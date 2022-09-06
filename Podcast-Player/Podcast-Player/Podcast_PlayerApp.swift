//
//  Podcast_PlayerApp.swift
//  Podcast-Player
//
//  Created by sungyeon kim on 2022/09/06.
//

import SwiftUI

@main
struct Podcast_PlayerApp: App {
    let userSettings = UserSettings()
    var body: some Scene {
        WindowGroup {
            ObservableObjectAnother().environmentObject(userSettings)
        }
    }
}
