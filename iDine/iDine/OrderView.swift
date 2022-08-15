//
//  OrderView.swift
//  iDine
//
//  Created by sungyeon kim on 2022/08/16.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        } //: HSTACK
                    } //: FOREACH
                } //: SECTION
                
                Section {
                    NavigationLink(destination: Text("Check out")) {
                        Text("Place Order")
                    }
                } //: SECTION
                .navigationTitle("Order")
                .listStyle(InsetGroupedListStyle())
            } //: LIST
        }//: NAVIGATION
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
