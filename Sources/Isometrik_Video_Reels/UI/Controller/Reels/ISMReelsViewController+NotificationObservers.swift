//
//  ISMReelsViewController+NotificationObservers.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation
import UIKit


extension ISMReelsViewController {
    func addCustomObservers(from dictionary: [[Notification.Name: Selector]]) {
        for mapping in dictionary {
            for (name, selector) in mapping {
                NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
            }
        }
    }

        func removeCustomObservers(from dictionary: [[Notification.Name: Selector]]) {
            for mapping in dictionary {
                for (name, _) in mapping {
                    NotificationCenter.default.removeObserver(self, name: name, object: nil)
                }
            }
        }
    
}

extension ISMReelsViewController{
    func addCustomObservers() {
        self.addCustomObservers(from: observersMap)
    }
    func removeCustomObservers() {
        self.removeCustomObservers(from: observersMap)
    }
    
    func makeObserversDictionary() {
        observersMap =  [
            [.scrollToNextVideo:#selector(scrollToNextCell)],
            [.openMoreView:#selector(openMoreView)],
            [.openCommentsView:#selector(openCommentsView)],
            [.openSendTipView : #selector(openSendTipView(_:))],
            [.openBottomProfileView : #selector(openBottomProfileView(_ :))],
            [.openShareView : #selector(openShareView(_:))],
            [.openLoginScreen : #selector(openLoginScreen)],
            [.openViewersView : #selector(openViewersView(_ :))],
            [.manageLikeAndUnlikePosts : #selector(manageLikeAndUnlikePosts)],
            [.reloadData : #selector(reloadData)],
            [.openMusicView : #selector(openMusicView)],
            [.followAndUnfollowUser : #selector(followAndUnfollowUser)],
            [.followAndUnfollowUserFromFollowingView : #selector(followAndUnfollowUserFromFollowing)],
            [.openProfileViewFromFollowingView : #selector(openProfileFromFollowing)],
            [.updateFollowing : #selector(updateFollowingsData)],
            [.updateTrending : #selector(updateTrendingData)],
            [.unlockPost : #selector(unlockPostTapped)],
            [.subscribePost : #selector(subscribePostTapped)],
            [.openMentionedUsers : #selector(openMentionedUsersAction)],
            [.openHastag : #selector(openHastagAction)],
            [.openLocationView : #selector(openLocationView)],
            [.logOut : #selector(logOut)],
            [.presentAds: #selector(presentAdsAfter6Reels)]
            
        ]
        addCustomObservers()
    }
 
    
    
}
