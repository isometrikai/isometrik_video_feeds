//
//  ISMReelsUtility.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 27/12/24.
//

import Foundation

extension NSNotification.Name {
    static let stopVideoPlayback : NSNotification.Name = NSNotification.Name("stopVideoPlayback")
    static let playVideoPlayback : NSNotification.Name = NSNotification.Name("playVideoPlayback")
    static let scrollToNextVideo : NSNotification.Name = NSNotification.Name("scrollToNextVideo")
    static let openMoreView : NSNotification.Name = NSNotification.Name("openMoreView")
}


class ISMReelsUtility {
    //MARK: - Functions
    /// post stopping of video on reels
    static func postStopVideoPlayback() {
        NotificationCenter.default.post(name: .stopVideoPlayback , object: nil)
    }
    static func postPlayVideoPlayback() {
        NotificationCenter.default.post(name: .playVideoPlayback , object: nil)
    }
    static func postScrollToNextVideo() {
        NotificationCenter.default.post(name: .scrollToNextVideo , object: nil)
    }
    static func postOpenMoreView() {
        NotificationCenter.default.post(name: .openMoreView , object: nil)
    }
    
    
}
