//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/19.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

public func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
  if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
    videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
    videoPlayer?.play()
  }
  
  return videoPlayer!
}
