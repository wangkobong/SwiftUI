//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by sungyeon kim on 2022/09/08.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        print(#function)
        cancellable = Webservice().getAllTopStories()
            .map { stories in
                stories.map { StoryViewModel(story: $0) }
            }
            .sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
                self.stories = storyViewModels
            })
    }
}

struct StoryViewModel {
    
    let story: Story
    
    var id: Int {
        return self.story.id
    }
    
    var title: String {
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
}
