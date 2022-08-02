//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by sungyeon kim on 2022/08/01.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date()) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
