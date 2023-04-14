//
//  SignupModel.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/05/18.
//

import Foundation

struct SignupModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let title: String
    var isSelected: Bool = false
}
