//
//  AnimalsModel.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/17.
//

import Foundation

struct Animal: Identifiable, Codable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
