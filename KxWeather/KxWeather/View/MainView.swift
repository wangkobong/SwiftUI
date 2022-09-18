//
//  MainView.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/14.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            WeatherContentView()
        }//: ZSTACK
        .onAppear {
            service.fetch()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WeatherService.preview)
    }
}
