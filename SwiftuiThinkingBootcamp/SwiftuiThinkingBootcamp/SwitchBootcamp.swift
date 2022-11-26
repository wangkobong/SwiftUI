//
//  SwitchBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/26.
//

import SwiftUI

struct SwitchBootcamp: View {
    
    @State private var toggleIsOn = false
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $toggleIsOn) {
                Text("Change status")
            }
            .toggleStyle(SwitchToggleStyle(tint: .red))
            
            Spacer()
        }
        .padding(.horizontal, 80)
    }
}

struct SwitchBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SwitchBootcamp()
    }
}
