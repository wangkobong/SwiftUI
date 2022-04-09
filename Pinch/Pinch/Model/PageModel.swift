//
//  PageModel.swift
//  Pinch
//
//  Created by sungyeon kim on 2022/04/09.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
  
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
