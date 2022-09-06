//
//  Episode.swift
//  Podcast-Player
//
//  Created by sungyeon kim on 2022/09/06.
//

import Foundation
import SwiftUI

struct Episode: Identifiable {
    let id = UUID()
    let name: String
    let track: String
}
