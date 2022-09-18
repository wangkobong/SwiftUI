//
//  KxWeatherApp.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/14.
//

import SwiftUI

@main
struct KxWeatherApp: App {
    
    let service = WeatherService()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(service)
        }
    }
}
