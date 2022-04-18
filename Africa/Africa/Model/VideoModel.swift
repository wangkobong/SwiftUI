//
//  VideoModel.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/18.
//

import Foundation

struct Video: Identifiable, Codable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  
  var thumbnail: String {
    "video-\(id)"
  }
}
