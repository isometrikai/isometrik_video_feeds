//
//  ISMReelsCollectionViewCell+Delegates.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation

extension ISMReelsCollectionViewCell : ISMReelsDelegates{
    func didTapProfileButton() {
        //open other user's profile
    }
    
    func didTapFollowButton(isFollowed: Bool) {
        if isFollowed{
            //call api to follow a user
        }else{
            //call api to unfollow a user
        }
    }
    
    func likeTapped(islike: Bool) {
        if islike{
            //call like api
        }else{
            //call dislike Api
        }
    }
    
    func muteTapped(isMute: Bool) {
        self.player?.isMuted = isMute
    }
    
    func reelsViewDidPlayPauseTapped(isPlaying: Bool) {
        isPlaying ? stopVideo() : playVideo()
    }
 
    
    
}
