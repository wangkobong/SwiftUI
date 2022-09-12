//
//  WKWebView+Extensions.swift
//  HackerNews
//
//  Created by sungyeon kim on 2022/09/12.
//

import Foundation
import WebKit

extension WKWebView {
    
    static func pageNotFoundView() -> WKWebView {
        let wk = WKWebView()
        wk.loadHTMLString("<html><body><h1>Page not found!</h1></body></html>", baseURL: nil)
        return wk
    }
}
