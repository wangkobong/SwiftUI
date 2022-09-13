//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by sungyeon kim on 2022/09/12.
//

import SwiftUI

struct StoryDetailView: View {
    
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    var storyId: Int
    
    init(storyId: Int) {
        self.storyDetailVM = StoryDetailViewModel()
        self.storyId = storyId
    }
    
    var body: some View {
        VStack {
            Text(storyDetailVM.title)
            WebView(url: storyDetailVM.url)
        }.onAppear {
            storyDetailVM.fetchStoryDetails(storyId: self.storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
