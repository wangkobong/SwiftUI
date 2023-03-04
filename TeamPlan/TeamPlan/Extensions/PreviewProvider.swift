//
//  PreviewProvider.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/05.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

final class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let termsViewModel = TermsViewModel()
}
