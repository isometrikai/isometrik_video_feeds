//
//  ISMReelsCollectionViewCell+Delegates.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation
import AVFoundation
extension ISMReelsCollectionViewCell : ISMReelsDelegates{
    func reelsViewDoubleTapped() {
        //Double tapping reels view
        if !IVSKit.getIsGuestUser() {
            self.socialView.likeTapped(isFromDoubleTap: true)
            self.postLikeView.showImageWithBounceEffect()
        }else {
            IVSReelsUtility.postOpenLoginScreen()
        }
    }
    
    func openProfilePage() {
        //open other user's profile
//        configDelegate?.didTapProfile()
    }
    
    func followPopularUser() {
        //follow other user's profile
//        configDelegate?.didFollowUser()
    }
    
    func fastForwardVideo() {
        print("Inside fastForwardVideo")
        guard let player = player else { return }
        
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let fastForwardTime = currentTime + 5 // Fast-forward by 10 seconds
        
        // Ensure you don't fast forward past the video duration
        let duration = CMTimeGetSeconds(player.currentItem?.duration ?? CMTime.zero)
        let newTime = min(fastForwardTime, duration)
        
        let newTimeCM = CMTime(seconds: newTime, preferredTimescale: 600)
        player.seek(to: newTimeCM)
    }
    
    func rewindVideo() {
        guard let player = player else { return }

        let currentTime = CMTimeGetSeconds(player.currentTime())
        let rewindTime = currentTime - 5 // Rewind by 10 seconds

        // Ensure you don't rewind before the start of the video
        let newTime = max(rewindTime, 0) // Ensure the time is not negative

        let newTimeCM = CMTime(seconds: newTime, preferredTimescale: 600)
        player.seek(to: newTimeCM)
    }
    
    func didTapProfileButton() {
        //open other user's profile
//        configDelegate?.didTapProfile()
    }
    
    func didTapFollowButton(isFollowed: Bool) {
        if isFollowed{
            //call api to follow a user
//            configDelegate?.didFollowUser()
        }else{
            //call api to unfollow a user
//            configDelegate?.didUnFollowUser()
        }
    }
    
    func likeTapped(islike: Bool) {
        if islike{
            //call like api
//            configDelegate?.didLikeUser()
        }else{
            //call dislike Api
//            configDelegate?.didUnLikeUser()
        }
    }
    
    func muteTapped(isMute: Bool) {
        self.player?.isMuted = isMute
    }
    
    func reelsViewDidPlayPauseTapped(isPlaying: Bool) {
        isPlaying ? stopVideo() : playVideo()
    }
    
    
    
}
