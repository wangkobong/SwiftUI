//
//  VideoListView.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/16.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - PROPERTIES
  
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - BODY
    var body: some View {
      NavigationView {
        List {
          ForEach(videos) { item in
            NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
              VideoListItemView(video: item)
                .padding(.vertical, 8)
            } //: LINK
          } //: LOOP
        } //: LIST
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Videos")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              // Shuffle videos
              videos.shuffle()
              hapticImpact.impactOccurred()
            }) {
              Image(systemName: "arrow.2.squarepath")
            }
          }
        }
      } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
