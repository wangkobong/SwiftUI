//
//  ChartView.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/03/07.
//

import SwiftUI

struct ChartView: View {
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
    }
    
    // 300
    // 100
    // 3
    // 1 * 3 = 3
    // 2 * 3 = 6
    // 3 * 3 = 9
    // 100 * 3 = 300
    
    // 60,000 - max
    // 50,000 - min
    // 60,000 - 50,000 = 10,000 -> yAxis
    // 52,000 - data point
    // 52,000 - 50,000 = 2,000 / 10,000 - 20%
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    let yPosition = CGFloat((data[index] - minY) / yAxis * geometry.size.height)
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: 0, y: 0))
                    }
                    
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: dev.coin)
    }
}
