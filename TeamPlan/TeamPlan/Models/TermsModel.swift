//
//  TermsModel.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/04.
//

import Foundation

struct TermsModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let title: String
    var isSelected: Bool
    var isWhole: Bool = false
    let isNecessary: Bool
}
