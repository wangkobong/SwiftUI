//
//  ViewController.swift
//  CombineWithUIKit
//
//  Created by sungyeon kim on 2022/10/31.
//

import UIKit
import Combine

class QuoteViewModel {
    
    enum Input {
        case viewDidAppear
        case refreshButtonDidTap
    }
    
    enum Output {
        case fetchedQuoteDidFail(error: Error)
        case fetchQuoteDidSucceed(quote: Quote)
        case toggleButton(isEnabled: Bool)
    }
    
    // DI
    private let quoteServiceType: QuoteServiceType
    private let output: PassthroughSubject<Output, Never> = .init()
    private var cancellable = Set<AnyCancellable>()
    
    
    init(quoteServiceType: QuoteServiceType = QuoteService()) {
        self.quoteServiceType = quoteServiceType
    }
    
    func transform(input: AnyPublisher<Input,Never>) -> AnyPublisher<Output,Never> {
        
        input.sink { [weak self] event in
            switch event {
            case .refreshButtonDidTap:
                self?.handleGetRandomQuote()
            case .viewDidAppear:
                self?.handleGetRandomQuote()
            }
        }
        .store(in: &cancellable)
        
        return output.eraseToAnyPublisher()
    }
    
    private func handleGetRandomQuote() {
        output.send(.toggleButton(isEnabled: false))
        quoteServiceType.getRandomQuote()
            .sink { [weak self] completion in
                self?.output.send(.toggleButton(isEnabled: true))
                if case .failure(let error) = completion {
                    self?.output.send(.fetchedQuoteDidFail(error: error))
                }
            } receiveValue: { [weak self] quote in
                self?.output.send(.fetchQuoteDidSucceed(quote: quote))
                
            }
            .store(in: &cancellable)
    }
}

class QuoteViewController: UIViewController {
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    private let vm = QuoteViewModel()
    private let input: PassthroughSubject<QuoteViewModel.Input, Never> = .init()
    private var cancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        input.send(.viewDidAppear)
    }
    
    // 2
    private func bind() {
        let output = vm.transform(input: .init(input.eraseToAnyPublisher()))
        
        output
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
            switch event {
            case .fetchQuoteDidSucceed(let quote):
                self?.quoteLabel.text = quote.content
            case .fetchedQuoteDidFail(let error):
                self?.quoteLabel.text = error.localizedDescription
            case .toggleButton(let isEnabled):
                self?.refreshButton.isEnabled = isEnabled
            }
        }
        .store(in: &cancellable)
    }

    @IBAction func didTapRefresh(_ sender: Any) {
        
        input.send(.refreshButtonDidTap)
    }
}

protocol QuoteServiceType {
    func getRandomQuote() -> AnyPublisher<Quote, Error>
    
}

class QuoteService: QuoteServiceType {
    func getRandomQuote() -> AnyPublisher<Quote, Error> {
        let url = URL(string: "https://api.quotable.io/random")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .catch { error in
                return Fail(error: error).eraseToAnyPublisher()
            }
            .map({ $0.data })
            .decode(type: Quote.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

struct Quote: Codable {
    let content: String
    let author: String
}
