//
//  ISMReelsViewController+Actions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 25/12/24.
//

import Foundation
import UIKit

extension ISMReelsViewController{
    //MARK: - Actions
    @objc func profileTapped(){
         print("open profile")
        if !IVSKit.getIsGuestUser() {
            configDelegate?.didTapProfile(postUserId: IVSKit.getUserId(), postUserNaame: IVSKit.getUserName())
        }else {
            configDelegate?.presentLoginScreen()
        }
    }
    
    @objc func findNewUsersTapped(){
        print("open find new users")
        configDelegate?.didTapfindUserButton()
    }
    
    
    @objc func manageLikeAndUnlikePosts(notification : Notification) {
        print("Manage Like and Unlike Posts")
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let userID = userInfo["userId"] as? String,
               let postID = userInfo["postId"] as? String,
               let liked = userInfo["isliked"] as? Bool{
                
                let request = IVSAPIRequest(endPoint: liked ? IVSReelsEndpoints.likeUser : IVSReelsEndpoints.unlikeUser, requestBody: SocialContent(userId: userID, postId: postID))
                
                IVSAPIManager.sendRequest(request: request) {[weak self] (result : IVSResult<SocialResult,IVSReelsAPIError>) in
                    guard let self = self else {return}
                    switch result {
                    case .success(let data , _):
                        DispatchQueue.main.async {
                            self.refreshControl.endRefreshing()
                            self.adapter.performUpdates(animated: false)
                        }
                    case .failure(let errorData):
                        break
                    }
                }
            }
        }
    }
    
    @objc func reloadData() {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.adapter.performUpdates(animated: true)
        }
    }
    
    
    
    @objc func socialOptionsTapped(){
         print("open socialOptions")
        if !IVSKit.getIsGuestUser() {
            configDelegate?.didTapSocialOptions()
        }else {
            configDelegate?.presentLoginScreen()
        }
    }
    
    @objc func backButtonTapped() {
       print("Back Button Tapped")
        configDelegate?.didBackButtonTapped()
    }
    
    @objc func openLoginScreen(){
        configDelegate?.presentLoginScreen()
    }
    
    @objc func openViewersView(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let postId = userInfo["postID"] as? String{
            configDelegate?.didTapViewerView(postId: postId)
        }
    }
    
    @objc func followingTapped(){
        if !IVSKit.getIsGuestUser() {
            IVSLoaderView.show()
            IVSReelsUtility.postStopVideoPlayback()
            IVSReelsUtility.selectedReelsCategory = .following
            IVSReelsUtility.showPopularUsers = false
            self.viewModel.homeOffset = 0
            self.viewModel.homeReels.removeAll()
            print("open following")
            
            //hit following
            trendingButtonUnderlineView.isHidden = true
            followingButtonUnderlineView.isHidden = false
            exclusiveButtonUnderlineView.isHidden = true
            self.fetchHomeData()
        }else {
            //delegate to present login screen
            configDelegate?.presentLoginScreen()
        }

    }
    
    @objc func updateFollowingsData(){
        self.viewModel.homeOffset = 0
        self.viewModel.homeReels.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
            guard let self else {return}
            self.followingTapped()
            print("open following")
        }
        //hit following
//        self.fetchHomeData()
    }
    
    @objc func trendingTapped(){
        print("open trending")
        IVSLoaderView.show()
        self.viewModel.offset = 0
        IVSReelsUtility.postStopVideoPlayback()
        IVSReelsUtility.selectedReelsCategory = .trending
        self.viewModel.reels.removeAll()
        trendingButtonUnderlineView.isHidden = false
        followingButtonUnderlineView.isHidden = true
        exclusiveButtonUnderlineView.isHidden = true
        self.fetchData()
    }
    
    @objc func exclusiveTapped(){
        if !IVSKit.getIsGuestUser() {
            print("open exclusive")
            self.viewModel.exclusiveOffset = 0
            self.viewModel.exclusiveReels.removeAll()
            IVSReelsUtility.postStopVideoPlayback()
            IVSReelsUtility.selectedReelsCategory = .exclusive
            trendingButtonUnderlineView.isHidden = true
            followingButtonUnderlineView.isHidden = true
            exclusiveButtonUnderlineView.isHidden = false
            self.fetchExclusiveData()
        }else {
            configDelegate?.presentLoginScreen()
        }
//        exclusiveButton.backgroundColor = IVSKit.shared.getThemeColor()
//        followingButton.backgroundColor = UIColor(resource: .soGray)
//        trendingButton.backgroundColor = UIColor(resource: .soGray)
        
        //call exclusive api
    }
    /// On clicking Coins button on the header of the Reels page
    @objc func coinsButtonTapped(){
      //open coins button
        print("Coin tapped")
        if !IVSKit.getIsGuestUser() {
            configDelegate?.didTapCoins()
        }else {
            configDelegate?.presentLoginScreen()
        }
       
    }
    
    @objc func playMostVisibleCellVideo() {
        // Ensure there are visible cells
        guard let visibleCells = reelsCollectionView.visibleCells as? [ISMReelsCollectionViewCell] else { return }
        
        var mostVisibleCell: ISMReelsCollectionViewCell?
        var maxVisibleHeight: CGFloat = 0
        
        // Get the collection view's visible rectangle
        let visibleRect = CGRect(
            origin: reelsCollectionView.contentOffset,
            size: reelsCollectionView.bounds.size
        )
        
        for cell in visibleCells {
            // Calculate the intersection of the cell's frame with the visible rect
            let intersection = visibleRect.intersection(cell.frame)
            let visibleHeight = intersection.height
            
            // Track the cell with the maximum visible height
            if visibleHeight > maxVisibleHeight {
                maxVisibleHeight = visibleHeight
                mostVisibleCell = cell
            }
        }
        
        // Play the video in the most visible cell
        if let cellToPlay = mostVisibleCell, let _ = cellToPlay.player {
            cellToPlay.playVideo()
        }
    }
    
    @objc func openMusicView(notification : Notification) {
        if IVSKit.getIsGuestUser() {
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let isPurchased = userInfo["isPurchased"] as? Bool,
               let data = userInfo["data"] as? IVSMediaData
            {
                configDelegate?.didTapMuicButton(isPurchased: isPurchased, data: data)
            }
        }
    }
    
    
    @objc func openMoreView(notification : Notification) {
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
//            let moreOptionsVC = ISMReelsMoreOptionsViewController()
//            moreOptionsVC.modalPresentationStyle = .overCurrentContext // Or .overFullScreen
//            moreOptionsVC.modalTransitionStyle = .crossDissolve
//            present(moreOptionsVC, animated: true, completion: nil)
            
            if let userInfo = notification.userInfo,
               let mediadata = userInfo["data"] as? IVSInterfaceMedia{
                configDelegate?.didTapMoreView(data: mediadata)
            }
            
            
        }
    }
    @objc func openCommentsView(notification : Notification) {
        
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            //open view inside sdk
            
//            let moreOptionsVC = ISMReelsCommentsViewController()
//            moreOptionsVC.modalPresentationStyle = .overCurrentContext // Or .overFullScreen
//            moreOptionsVC.modalTransitionStyle = .crossDissolve
//            present(moreOptionsVC, animated: true, completion: nil)
            
            //open view outside sdk

            if let userInfo = notification.userInfo,
               let commentsAllowed = userInfo["commentsAllowed"] as? Bool,
               let commentsCount = userInfo["commentsCount"] as? Int,
               let viewsCount = userInfo["viewsCount"] as? Int,
               let likesCount = userInfo["likesCount"] as? Int,
               let postID = userInfo["postID"] as? String,
               let postUserID = userInfo["userId"] as? String,
               let isPurchased = userInfo["isPurchased"] as? Bool,
               let isPaid = userInfo["isPaid"] as? Bool,
               let islikesSelected = userInfo["isLikesSelected"] as? Bool
                
            {
                // Perform action with received data
                configDelegate?.didTapComments(commentsAllowed: commentsAllowed, commentsCount: commentsCount, viewsCount: viewsCount, likesCount: likesCount, isPurchased: isPurchased, isPaid: isPaid, postId: postID, userId: postUserID, islikesSelected: islikesSelected)
            }
        }
    }
    
    @objc func openSendTipView(_ notification: Notification) {
        
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let postID = userInfo["postID"] as? String,
               let postUserName = userInfo["postUserName"] as? String,
               let postUserID = userInfo["postUserID"] as? String,
               let isPurchased = userInfo["isPurchased"] as? Bool,
               let isPaid = userInfo["isPaid"] as? Bool
            {
                
                print("Post ID: \(postID)")
                print("Post User Name: \(postUserName)")
                print("Post User ID: \(postUserID)")
                
                // Perform action with received data
                configDelegate?.sendTipAction(postID: postID, postUserName: postUserName, postUserID: postUserID,isPurchased: isPurchased , isPaid: isPaid )
            }
        }
    }
    
    
    @objc func openBottomProfileView(_ notification: Notification) {
        
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let postUserName = userInfo["postUserName"] as? String,
               let postUserID = userInfo["postUserID"] as? String
            {
                print("Post User Name: \(postUserName)")
                print("Post User ID: \(postUserID)")
                
                // Perform action with received data
                configDelegate?.didTapProfile(postUserId: postUserID, postUserNaame: postUserName)
            }
        }
    }
    
    @objc func openShareView(_ notification: Notification) {
        
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let postId = userInfo["postID"] as? String,
               let postUserName = userInfo["postUserName"] as? String,
               let postUserID = userInfo["postUserID"] as? String,
               let isPaid = userInfo["isPaid"] as? Bool,
               let isPurchased = userInfo["isPurchased"] as? Bool,
               let thumbnailUrl = userInfo["thumbnailUrl"] as? String,
               let imageUrl = userInfo["imageUrl"] as? String,
               let postTitle = userInfo["postTitle"] as? String,
               let mediaType = userInfo["mediaType"] as? Int
            {
                configDelegate?.didTapShareView(postUsername: postUserName, userId: postUserID, isPurchased: isPurchased, isPaid: isPaid, postId: postId,thumbnailUrl: thumbnailUrl, imageUrl: imageUrl, postTitle: postTitle, mediaType: mediaType)
            }
        }
    }

    @objc func followAndUnfollowUser(notification : Notification) {
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let isfollowed = userInfo["isfollowed"] as? Bool,
               let userId = userInfo["followingId"] as? String {
                if isfollowed {
                    configDelegate?.didFollowUser(userId: userId)
                }else {
                    configDelegate?.didUnFollowUser(userId: userId)
                }
            }
            }
        }
    
    @objc func followAndUnfollowUserFromFollowing(notification : Notification) {
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let isfollowed = userInfo["followStatus"] as? Int,
               let userId = userInfo["followUserID"] as? String {
                configDelegate?.didTapfollowUserFromFollowing(userId: userId, followStatus: isfollowed)
               
            }
        }
    }
    
    @objc func openProfileFromFollowing(notification : Notification) {
        print("openProfileFromFollowing")
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let memeberID = userInfo["memberId"] as? String,
               let username = userInfo["username"] as? String{
                
                configDelegate?.didTapProfile(postUserId: memeberID, postUserNaame: username)
              
                
            }
            }
        }
    
    @objc func unlockPostTapped(notification : Notification) {
        print("unlock Post")
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let data = userInfo["data"] as? IVSInterfaceMedia {
               configDelegate?.didTapUnlockPost(data: data)
            }
            }
        }
    
    @objc func subscribePostTapped(notification : Notification) {
        print("subscribe Post")
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let data = userInfo["data"] as? IVSInterfaceMedia {
                configDelegate?.didTapSubscribePost(data: data)
            }
        }
    }
    
    @objc func openHastagAction(notification : Notification) {
        print("open Hastag from Reels")
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let hashtag = userInfo["hashtag"] as? String {
                configDelegate?.didTapHashtag(withTag: hashtag)
            }
        }
    }
    
    @objc func openLocationView(notification : Notification) {
        print("open LocationView from Reels")
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let place = userInfo["place"] as? String ,
               let placeId = userInfo["placeID"] as? String,
               let latitude = userInfo["latitude"] as? Double,
               let longitude = userInfo["longitude"] as? Double
            {
                configDelegate?.placeTapped(place: place, placeID: placeId, latitude: latitude, longitude: longitude)
            }
        }
    }
    
    @objc func openMentionedUsersAction(notification : Notification) {
        print("open mention from Reels")
        if  IVSKit.getIsGuestUser(){
            configDelegate?.presentLoginScreen()
        }else {
            if let userInfo = notification.userInfo,
               let mentionedUser = userInfo["mentionedUser"] as? String {
                configDelegate?.didTapMentionedUser(user: mentionedUser)
            }
        }
    }
    
    @objc func logOut() {
        configDelegate?.logOutSDK()
    }
    
    func deletePost(postId: String) {
        dataSource.deleteData(postid: postId)
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
}
