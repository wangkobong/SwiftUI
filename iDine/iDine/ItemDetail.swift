//
//  ItemDetail.swift
//  iDine
//
//  Created by sungyeon kim on 2022/08/15.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    var item: MenuItem

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }//: ZSTACK
            
            Text(item.description)
                .padding()
            
            Button {
                order.add(item: item)
            } label: {
                Text("Order This")
            }
            .font(.headline)

            Spacer()
        }//: VSTACK
        .navigationTitle(Text(item.name))
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
