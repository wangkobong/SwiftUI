//
//  KxWeatherWidget.swift
//  KxWeatherWidget
//
//  Created by sungyeon kim on 2022/09/23.
//

import WidgetKit
import SwiftUI

@main
struct KxWeatherWidget: Widget {
    let kind: String = "KxWeatherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WeatherEntryView(entry: entry)
        }
        .configurationDisplayName("날씨 위젯")
        .description("현재 날씨를 확인할 수 있어요 :)")
        .supportedFamilies([.systemSmall])
    }
}

struct KxWeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: WeatherEntry(widgetData: .preview))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
