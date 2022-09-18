//
//  String+WeatherSymbol.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/19.
//

import Foundation

extension String {
    var weatherImageName: String {
        switch self {
        case "01d":
            return "sun.max.fill"
        case "01n":
            return "moon.fill"
        case "02d":
            return "cloud.sun.fill"
        case "02n":
            return "cloud.moon.fill"
        case "03d", "03n":
            return "cloud.fill"
        case "04d", "04n":
            return "smoke.fill"
        case "09d", "09n":
            return "cloud.rain.fill"
        case "10d":
            return "cloud.sun.rain.fill"
        case "10n":
            return "cloud.moon.rain.fill"
        case "11d", "11n":
            return "cloud.bold.rain.fill"
        case "13d", "13n":
            return "snowflake"
        case "50d", "50n":
            return "humidity"
        default:
            return "circle"
        }
    }
}
