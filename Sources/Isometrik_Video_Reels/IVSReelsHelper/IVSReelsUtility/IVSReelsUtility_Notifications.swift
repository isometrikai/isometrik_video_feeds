//
//  IVSReelsUtility_Notifications.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 21/01/25.
//

import Foundation

extension NSNotification.Name {
    static let stopVideoPlayback : NSNotification.Name = NSNotification.Name("stopVideoPlayback")
    static let playVideoPlayback : NSNotification.Name = NSNotification.Name("playVideoPlayback")
    static let scrollToNextVideo : NSNotification.Name = NSNotification.Name("scrollToNextVideo")
    static let openMoreView : NSNotification.Name = NSNotification.Name("openMoreView")
    static let openCommentsView : NSNotification.Name = NSNotification.Name("openCommentsView")
    static let openSendTipView : NSNotification.Name = NSNotification.Name("openSendTipView")
    static let openBottomProfileView : NSNotification.Name = NSNotification.Name("openBottomProfileView")
    static let openShareView : NSNotification.Name = NSNotification.Name("openShareView")
    static let openViewersView : NSNotification.Name = NSNotification.Name("openViewersView")
    static let openLoginScreen : NSNotification.Name = NSNotification.Name("openLoginScreen")
    static let manageLikeAndUnlikePosts : NSNotification.Name = NSNotification.Name("manageLikeAndUnlikePosts")
    static let reloadData: NSNotification.Name = NSNotification.Name("reloadData")
    static let openMusicView : NSNotification.Name = NSNotification.Name("openMusicView")
    static let followAndUnfollowUser : NSNotification.Name = NSNotification.Name("followAndUnfollowUser")
    static let followAndUnfollowUserFromFollowingView : NSNotification.Name = NSNotification.Name("followAndUnfollowUserFromFollowingView")
    static let openProfileViewFromFollowingView : NSNotification.Name = NSNotification.Name("openProfileViewFromFollowingView")
    static let updateFollowing : NSNotification.Name = NSNotification.Name("updateFollowing")
    static let updateTrending : NSNotification.Name = NSNotification.Name("updateTrending")
    static let unlockPost : NSNotification.Name = NSNotification.Name("unlockPost")
    static let subscribePost : NSNotification.Name = NSNotification.Name("subscribePost")
    static let openHastag : NSNotification.Name = NSNotification.Name("openHastag")
    static let openMentionedUsers : NSNotification.Name = NSNotification.Name("openMentionedUsers")
    static let openLocationView : NSNotification.Name = NSNotification.Name("openLocationView")
    static let logOut : NSNotification.Name = NSNotification.Name("logOut")
}
