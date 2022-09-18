//
//  WeatherService+Api.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/19.
//

import Foundation
import CoreLocation

extension WeatherService {
    
    func fetchWeather(location: CLLocation) async {
        do {
            let fetchedCurrentWeather = try await fetch(location: location)
            currentWeather = CurrentWeather(data: fetchedCurrentWeather)
            print(currentWeather)
        } catch {
            lastError = "Api 요청 실패"
        }
    }
    
    private func fetch(location: CLLocation) async throws -> CodableCurrentWeather {
        
        var components = URLComponents(string: "https://openweathermap.org/data/2.5/weather")
        
        components?.queryItems = [
            URLQueryItem(name: "appid", value: Self.apiKey),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "lang", value: "kr"),
            URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
            URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)")
        ]
        
        guard let url = components?.url else {
            throw ApiError.invalidUrl(components?.host ?? "")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ApiError.failed(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(CodableCurrentWeather.self, from:  data)
        
        return result
    }
}
