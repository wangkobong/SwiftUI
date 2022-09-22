//
//  WeatherEntry.swift
//  KxWeatherWidgetExtension
//
//  Created by sungyeon kim on 2022/09/23.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    let widgetData: WidgetData
    
    var date: Date {
        widgetData.date
    }
}
