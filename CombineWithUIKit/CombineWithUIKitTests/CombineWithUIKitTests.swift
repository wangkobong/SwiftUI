//
//  CombineWithUIKitTests.swift
//  CombineWithUIKitTests
//
//  Created by sungyeon kim on 2022/10/31.
//

import XCTest
import Combine
@testable import CombineWithUIKit

final class CombineWithUIKitTests: XCTestCase {
    
    var sut: QuoteViewModel!
    var quoteService: MockQuoteServiceType!

    override func setUp()  {
        quoteService = MockQuoteServiceType()
        sut = QuoteViewModel(quoteServiceType: quoteService)
    }

    override func tearDown()  {
       
    }


}

class MockQuoteServiceType: QuoteServiceType {
    var value: AnyPublisher<CombineWithUIKit.Quote, Error>?
    func getRandomQuote() -> AnyPublisher<CombineWithUIKit.Quote, Error> {
        return value ?? Empty().eraseToAnyPublisher()
    }

}
