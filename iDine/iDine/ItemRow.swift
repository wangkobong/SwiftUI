//
//  ItemRow.swift
//  iDine
//
//  Created by sungyeon kim on 2022/08/14.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }//: VSTACK
        }//: HSTACK
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
