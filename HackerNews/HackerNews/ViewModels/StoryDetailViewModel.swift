//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by sungyeon kim on 2022/09/12.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
    

    private var cancellable: AnyCancellable?
    
    @Published private var story = Story.placeholder()
    
    init() {
    
    }
    
    func fetchStoryDetails(storyId: Int) {
        self.cancellable = Webservice().getStoryById(storyId: storyId)
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
