//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by sungyeon kim on 2022/09/12.
//

import SwiftUI

struct StoryDetailView: View {
    
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    
    init(storyId: Int) {
        self.storyDetailVM = StoryDetailViewModel(storyId: storyId)
    }
    
    var body: some View {
        VStack {
            Text(storyDetailVM.title)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
