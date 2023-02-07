//
//  CircleButtonView.swift
//  SwiftUICrypto
//
//  Created by sungyeon kim on 2023/02/07.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    init(iconName: String) {
        self.iconName = iconName
    }
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
        
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
            
        }

    }
}
