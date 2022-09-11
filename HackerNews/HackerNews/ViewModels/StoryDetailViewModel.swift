//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by sungyeon kim on 2022/09/12.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
    
    var storyId: Int
    private var cancellable: AnyCancellable?
    
    @Published private var story: Story!
    
    init(storyId: Int) {
        self.storyId = storyId
        self.cancellable = Webservice().getStoryById(storyId: self.storyId)
            .catch { _ in Just(Story.placeholder())}
            .sink(receiveCompletion: { _ in }, receiveValue: { story in
                self.story = story
            })
    }
}

extension StoryDetailViewModel {
    
    var title: String {
        return story.title
    }
    
    var url: String {
        return story.url
    }
    
}
