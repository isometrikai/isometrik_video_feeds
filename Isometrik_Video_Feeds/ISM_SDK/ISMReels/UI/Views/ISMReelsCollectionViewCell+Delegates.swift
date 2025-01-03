//
//  ISMReelsCollectionViewCell+Delegates.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation
import AVFoundation
extension ISMReelsCollectionViewCell : ISMReelsDelegates{
    func fastForwardVideo() {
        print("Inside fastForwardVideo")
        guard let player = player else { return }
        
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let fastForwardTime = currentTime + 10 // Fast-forward by 10 seconds
        
        // Ensure you don't fast forward past the video duration
        let duration = CMTimeGetSeconds(player.currentItem?.duration ?? CMTime.zero)
        let newTime = min(fastForwardTime, duration)
        
        let newTimeCM = CMTime(seconds: newTime, preferredTimescale: 600)
        player.seek(to: newTimeCM)
    }
    
    func rewindVideo() {
        guard let player = player else { return }

        let currentTime = CMTimeGetSeconds(player.currentTime())
        let rewindTime = currentTime - 10 // Rewind by 10 seconds

        // Ensure you don't rewind before the start of the video
        let newTime = max(rewindTime, 0) // Ensure the time is not negative

        let newTimeCM = CMTime(seconds: newTime, preferredTimescale: 600)
        player.seek(to: newTimeCM)
    }
    
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
