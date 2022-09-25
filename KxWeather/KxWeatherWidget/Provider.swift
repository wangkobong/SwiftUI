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
        var data = WidgetData.preview
        
        if !context.isPreview {
            let list = WidgetData.read()
            if !list.isEmpty {
                data = list[0]
            }
        }
        
        let entry = WeatherEntry(widgetData: data)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        let entries = WidgetData.read().map {
            WeatherEntry(widgetData: $0)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
