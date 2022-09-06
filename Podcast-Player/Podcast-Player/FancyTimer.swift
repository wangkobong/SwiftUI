//
//  FancyTimer.swift
//  Podcast-Player
//
//  Created by sungyeon kim on 2022/09/07.
//

import Foundation
import SwiftUI
import Combine

class FancyTimer: ObservableObject {
    
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
    
}
