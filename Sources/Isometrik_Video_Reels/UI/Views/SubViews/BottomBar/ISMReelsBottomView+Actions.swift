//
//  ISMReelsBottomView+Actions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

extension ISMReelsBottomView{
    //MARK: - Button Actions
    
    /// Opens user's profile ,who has posted the reel
    @objc func profileTapped(){
        print("profile Tapped")
        IVSReelsUtility.postOpenBottomProfileView(postUserName: data.name, postUserID: data.userId)
    }
    /// Follows a user who has posted a ree;
    @objc func followTapped(){
        print("follow Tapped")
        if IVSKit.getIsGuestUser() {
            IVSReelsUtility.postOpenLoginScreen()
        }else {
            isFollowed.toggle()
            IVSReelsUtility.followAndUnfollowUser(isfollowed: isFollowed, userID: data.userId)
        }
    }
    @objc func fastForwardTapped(){
        print("Fast Forward Tapped")
        delegate?.fastForwardVideo()
    }
    @objc func rewindTapped(){
        print("Rewind Tapped")
        delegate?.rewindVideo()
    }
    @objc func placeTapped(){
        print("Place Tapped")
        if IVSKit.getIsGuestUser() {
            IVSReelsUtility.postOpenLoginScreen()
        }else {
            IVSReelsUtility.postOpenLocationView(place: data.place ?? "", placeID: data.placeId ?? "", latitude: data.latitude ?? 0, longitude: data.longitude ?? 0)
        }
    }
    
    @objc func categoryTapped(){
        print("Category Tapped")
        if IVSKit.getIsGuestUser() {
            IVSReelsUtility.postOpenLoginScreen()
        }else {
            print("Open Category View")
        }
    }
    
    @objc func musicButtonTapped() {
       print("Music Button TAPPED")
        IVSReelsUtility.postOpenMusicView(isPurchased: data.isPurchased, data: IVSMediaData(_id: data.musicData?._id, artist: data.musicData?.artist, audioStatus: data.musicData?.audioStatus, audioStatusText: data.musicData?.audioStatusText, createdOn: data.musicData?.createdOn, duration: data.musicData?.duration, imageUrl: data.musicData?.imageUrl, name: data.musicData?.name, path: data.musicData?.path, sequenceId: data.musicData?.sequenceId, songBackground: data.musicData?.songBackground, isOriginalSound: data.musicData?.isOriginalSound))
    }
    
}
