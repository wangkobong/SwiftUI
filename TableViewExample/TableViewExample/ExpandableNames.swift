//
//  ExpandableNames.swift
//  TableViewExample
//
//  Created by sungyeon kim on 2022/08/01.
//

import Foundation

struct ExpandableNames {
    var isExpanded: Bool
    var names: [Contact]
}

struct Contact {
    let name: String
    var hasFavorited: Bool
}
