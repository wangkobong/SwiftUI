//
//  MainView.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/14.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            WeatherContentView()
        }//: ZSTACK
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
