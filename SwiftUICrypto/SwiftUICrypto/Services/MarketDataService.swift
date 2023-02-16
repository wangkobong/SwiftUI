//
//  MarketDataService.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/17.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] marketData in
                self?.marketData = marketData.data
                self?.marketDataSubscription?.cancel()
            })
        
    }
    
}
