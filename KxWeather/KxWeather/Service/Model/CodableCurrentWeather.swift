//
//  CodableCurrentWeather.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/19.
//

import Foundation

struct CodableCurrentWeather: Codable {
    let dt: Double
    let weather: [Weather]
    let main: Main
    let sys: Sys
}

struct Weather: Codable {
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Sys: Codable {
    let sunrise: Double
    let sunset: Double
}
