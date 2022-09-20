//
//  CodableForecast.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/20.
//

import Foundation

struct CodableForecast: Codable {
    let list: [ListItem]
}

struct ListItem: Codable {
    let dt: Double
    let main: Main
    let weather: [Weather]
}


