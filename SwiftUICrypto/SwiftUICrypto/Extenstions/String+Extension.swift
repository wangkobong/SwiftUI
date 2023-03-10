//
//  String+Extension.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/03/15.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
