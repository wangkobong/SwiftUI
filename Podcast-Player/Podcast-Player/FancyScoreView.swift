//
//  FancyScoreView.swift
//  Podcast-Player
//
//  Created by sungyeon kim on 2022/09/07.
//

import SwiftUI

struct FancyScoreView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("\(userSettings.score)")
            Button {
                userSettings.score += 1
            } label: {
                Text("Increment Score")
            }
            .padding()
            .background(.green)

        }
        .padding()
        .background(.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
    }
}
