//
//  Story.swift
//  HackerNews
//
//  Created by sungyeon kim on 2022/09/12.
//

import Foundation

struct Story: Codable {
    
    let id: Int
    let title: String
    let url: String
    
}

extension Story {
    
    static func placeholder() -> Story {
        return Story(id: 0, title: "N/A", url: "")
    }
}
