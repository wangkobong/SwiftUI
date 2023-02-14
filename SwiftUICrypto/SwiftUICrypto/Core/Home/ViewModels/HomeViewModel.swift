//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/10.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
        
        // updates allcoins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
            
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        return coins.filter { $0.name.lowercased().contains(lowercasedText) ||
                                        $0.symbol.lowercased().contains(lowercasedText) ||
                                        $0.id.lowercased().contains(lowercasedText)
            
        }
    }
    
}
