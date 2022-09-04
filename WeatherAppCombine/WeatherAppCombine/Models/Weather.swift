//
//  Weather.swift
//  WeatherAppCombine
//
//  Created by sungyeon kim on 2022/09/04.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
    
    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
}
