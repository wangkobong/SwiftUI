//
//  WeatherEntryView.swift
//  KxWeatherWidgetExtension
//
//  Created by sungyeon kim on 2022/09/23.
//

import SwiftUI

struct WeatherEntryView: View {
    var entry: Provider.Entry
    var body: some View {
        EmptyView()
    }
}

struct WeatherEntryView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: Provider.Entry(widgetData: .preview))
    }
}
