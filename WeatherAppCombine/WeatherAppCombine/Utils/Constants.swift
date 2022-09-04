//
//  Constants.swift
//  WeatherAppCombine
//
//  Created by sungyeon kim on 2022/09/04.
//

import Foundation

struct Constants {

    static func weather(city: String) -> String {
        return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=dfdb9931d08aba7873ef8b11b2ec3b3f&units=imperial"
    }
    
}
