//
//  FileManager+SharedContainer.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/25.
//

import Foundation

extension FileManager {
    static var sharedContainerURL: URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.kobong.KxWeather.contents")!
    }
}
