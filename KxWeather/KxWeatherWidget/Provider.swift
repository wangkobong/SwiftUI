//
//  Provider.swift
//  KxWeatherWidgetExtension
//
//  Created by sungyeon kim on 2022/09/23.
//

import Foundation
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(widgetData: .preview)
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        let entry = WeatherEntry(widgetData: .preview)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        var entries = [WeatherEntry(widgetData: .preview)]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
