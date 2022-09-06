//
//  ObservableObjectAnother.swift
//  Podcast-Player
//
//  Created by sungyeon kim on 2022/09/07.
//

import SwiftUI

struct ObservableObjectAnother: View {
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        
        VStack {
            Text("\(userSettings.score)")
                .font(.largeTitle)
            
            Button {
                userSettings.score += 1
            } label: {
                Text("Increment Score")
            }
            Spacer()
                .frame(height: 100)
            
            FancyScoreView()

        }
    }
}

struct ObservableObjectAnother_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectAnother()
    }
}
