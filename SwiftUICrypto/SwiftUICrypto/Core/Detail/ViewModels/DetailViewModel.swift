//
//  DetailViewModel.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/28.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { coinDetails in
                print("coinDetails: \(coinDetails)")
            }
            .store(in: &cancellables)
    }
    
}
