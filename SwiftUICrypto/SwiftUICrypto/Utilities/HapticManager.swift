//
//  HapticManager.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/26.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
