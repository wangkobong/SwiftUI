//
//  ApiError.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/19.
//

import Foundation

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
