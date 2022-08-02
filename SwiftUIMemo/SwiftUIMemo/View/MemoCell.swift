//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by sungyeon kim on 2022/08/01.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: MemoEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content ?? "")
                .font(.body)
                .lineLimit(1)
            
            Text(memo.insertDate ?? .now, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: MemoEntity(context: CoreDataManager.shared.mainContext))
    }
}
