//
//  UIApllication+Extenstion.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/14.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
