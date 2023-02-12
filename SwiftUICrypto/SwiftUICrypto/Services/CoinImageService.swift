//
//  CoinImageService.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/13.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap { UIImage(data: $0) }
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self]  image in
                self?.image = image
                self?.imageSubscription?.cancel()
            })
    }
}
