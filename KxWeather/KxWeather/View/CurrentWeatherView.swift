//
//  CurrentWeatherView.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/15.
//

import SwiftUI

struct CurrentWeatherView: View {
    let model: CurrentWeather?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let model = model {
                HStack {
                    Image(systemName: model.icon)
                    Text(model.weather)
                }//: HSTACK
                .font(.largeTitle)
                
                HStack(spacing: 20) {
                    Label(model.maxTemperature, systemImage: "arrow.up")
                    Label(model.minTemperature, systemImage: "arrow.down")
                }//: HSTACK
                
              
                HStack(alignment: .lastTextBaseline) {
                    Text(model.temperature)
                        .font(.system(size: 120))
                        .fontWeight(.ultraLight)
                    .minimumScaleFactor(0.5) // 공간이 부족하면 작아질 수 있게
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "sunrise.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(model.sunrise)
                        
                        Image(systemName: "sunset.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(model.sunset)
                    }//: HSTACK
                    .font(.caption)
                }//: HSTACK
            }
        }//: VSTACK
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(model: .preview)
    }
}
