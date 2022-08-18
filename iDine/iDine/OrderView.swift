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
                    .onDelete(perform: deleteItems(ao:))
                } //: SECTION
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                } //: SECTION
                .disabled(order.items.isEmpty)

            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            } //: LIST
        }//: NAVIGATION
    }
    
    func deleteItems(ao offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
