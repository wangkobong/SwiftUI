//
//  LazyVGridBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/10.


import SwiftUI

struct LazyVGridBootcamp: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
    ]
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 1")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.blue)
                            .font(.title)
                            
                    }
                    
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(.green)
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 2")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.green)
                            .font(.title)
                            
                    }


                }
            
//            LazyVGrid(columns: columns) {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .frame(height: 50)
//                }
//            }
        }
    }
}

struct LazyVGridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridBootcamp()
    }
}
