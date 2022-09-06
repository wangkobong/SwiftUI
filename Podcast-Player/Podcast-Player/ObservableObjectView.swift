//
//  ObservableObjectView.swift
//  Podcast-Player
//
//  Created by sungyeon kim on 2022/09/06.
//

import SwiftUI

struct ObservableObjectView: View {
    
    @ObservedObject var timer = FancyTimer()
    
    var body: some View {
        Text("\(timer.value)")
            .font(.largeTitle)
    }
}

struct ObservableObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectView()
    }
}
