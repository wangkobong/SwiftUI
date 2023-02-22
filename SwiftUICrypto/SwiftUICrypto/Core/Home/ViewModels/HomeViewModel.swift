//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/10.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var marketData: MarketDataModel? = nil
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDataService.$allCoins
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
        
        // updates marketData
        marketDataService.$marketData
            .map (mapGlobalMarketData)
            .sink { [weak self] stats in
                self?.statistics = stats
            }
            .store(in: &cancellables)
        
        // updates allcoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
        
        // updates portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { coinModels, portfolioEntities in
                coinModels
                    .compactMap { coin in
                        guard let entity = portfolioEntities.first(where:  { $0.coinID == coin.id }) else {
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self] coins in
                self?.portfolioCoins = coins
            }
            .store(in: &cancellables)
            
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
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
    
    private func mapGlobalMarketData(marketData: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        guard let data = marketData else { return stats }
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
    
}
