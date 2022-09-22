//
//  WidgetData.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/23.
//

import Foundation

struct WidgetData: Codable {
    let location: String
    let temperature: String
    let icon: String
    let weather: String
    let minTemperature: String
    let maxTemperature: String
    let date: Date
}

extension WidgetData {
    static let preview = WidgetData(location: "서울", temperature: Double.randomTemperatureString, icon: "sun.max.fill", weather: "맑음", minTemperature: Double.randomTemperatureString, maxTemperature: Double.randomTemperatureString, date: .now)
}
