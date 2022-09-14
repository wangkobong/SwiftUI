//
//  CurrentWeather.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/14.
//

import Foundation

struct CurrentWeather {
    let icon: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
    let sunrise: String
    let sunset: String
    let forecastData: Date
}

// 스유에서는 프리뷰에서 사용할 데이터도 함께 만드는게 좋음
extension CurrentWeather {
    static var preview: CurrentWeather {
        return CurrentWeather(icon: "sun.max",
                              weather: "맑음",
                              temperature: Double.randomTemperatureString,
                              maxTemperature: Double.randomTemperatureString,
                              minTemperature: Double.randomTemperatureString,
                              sunrise: "오전 6:00",
                              sunset:   "오후 6:00",
                              forecastData: .now)
    }
}
