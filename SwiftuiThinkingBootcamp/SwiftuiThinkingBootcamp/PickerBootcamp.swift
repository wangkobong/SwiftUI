//
//  PickerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/27.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "1"
    var body: some View {
        VStack {
            HStack {
                Text("Age: ")
                Text(selection)
            }
            Picker("픽커뷰",
                   selection: $selection) {
                ForEach (18..<100) { number in
                    Text("\(number)")
                        .font(.headline)
                        .foregroundColor(.red)
                        .tag("\(number)")
                }
            }
                   .pickerStyle(.wheel)
                   .background(.gray.opacity(0.3))
        }

    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
