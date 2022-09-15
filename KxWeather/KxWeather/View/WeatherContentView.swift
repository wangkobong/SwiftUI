//
//  WeatherContentView.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/15.
//

import SwiftUI

struct WeatherContentView: View {
    var body: some View {
        VStack {
            Text("강남역")
                .font(.title2)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Color.red
                        
                        CurrentWeatherView()
                        
                    }//: VSTACK
                    .frame(height: reader.size.height)
                    
                    Spacer(minLength: reader.safeAreaInsets.bottom)
                        
                    
                    ForecastView()
                }
            }//: GeometryReader
        }//: VSTACK
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView()
            .preferredColorScheme(.dark)
    }
}
