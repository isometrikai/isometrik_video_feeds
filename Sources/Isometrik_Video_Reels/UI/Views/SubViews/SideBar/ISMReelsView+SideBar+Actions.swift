//
//  ISMReelsView+SideBar+Actions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

extension ISMReelsSideBarSocialView{
    //MARK: - Button Actions
    
    ///  Action performed when mute button is tapped
    @objc func muteTapped(){
        print("mute Tapped")
        IVSReelsUtility.isMute.toggle()
        muteButton.setImage((IVSReelsUtility.isMute ? UIImage(resource: .ivsunmute) : UIImage(resource: .ivsmute)), for: .normal)
        delegate?.muteTapped(isMute: IVSReelsUtility.isMute)
    }
    
    @objc func likecountTapped() {
        if !IVSKit.getIsGuestUser() {
            if data.isPurchased || !data.isPaid {
                IVSReelsUtility.postOpenCommentsView(commentsAllowed: data.allowComments ?? false, commentsCount: data.commentsCount, viewsCount: data.viewsCount, likesCount: data.likesCount, isPurchased: data.isPurchased, isPaid: data.isPaid, postId: data.postId ?? "", userId: data.userId,isLikesSelected: true)
            }else{
                //show alert
                print("Post needs to be unlocked first to enable custom action")
                DispatchQueue.main.async { [weak self] in
                    self?.showAlert()
                }
            }
                
          
        }else {
            IVSReelsUtility.postOpenLoginScreen()
        }
    }
    
    /// Action performed when like Button is tapped
    @objc func likeTapped(isFromDoubleTap: Bool = false) {
        if !IVSKit.getIsGuestUser() {
            if data.isPurchased || !data.isPaid {
                if isFromDoubleTap {
                    // Double tap flow - Only like, don't unlike
                    if !(isLiked ?? false) {
                        isLiked = true
                        likesButton.isUserInteractionEnabled = true
                        updateLikeUIAndAPI()
                    }
                } else {
                    // Single tap flow - Toggle like/unlike only if no pending request
                    guard !isPendingLikeRequest else {
                        // Re-enable button if request is already in progress
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.likesButton.isUserInteractionEnabled = true
                        }
                        return
                    }
                    
                    isLiked.toggle()
                    updateLikeUIAndAPI()
                }
            } else {
                print("Post needs to be unlocked first to enable custom action")
                DispatchQueue.main.async { [weak self] in
                    self?.showAlert()
                }
            }
        } else {
            IVSReelsUtility.postOpenLoginScreen()
        }
    }

    @objc private func updateLikeUIAndAPI() {
        // Prevent multiple simultaneous requests
        guard !isPendingLikeRequest else { return }
        isPendingLikeRequest = true
        
        // Store current state for potential rollback
        let currentLikeState = !isLiked // The state before toggle
        let currentCount = data.likesCount
        
        // Determine the valid range based on original state
        let minCount: Int
        let maxCount: Int
        
        if originalLikeState {
            // Originally liked: can go from originalCount-1 (unlike) to originalCount (like)
            minCount = originalLikesCount - 1
            maxCount = originalLikesCount
        } else {
            // Originally not liked: can go from originalCount (unlike) to originalCount+1 (like)
            minCount = originalLikesCount
            maxCount = originalLikesCount + 1
        }
        
        // Calculate the new count based on current action
        let newCount: Int
        if isLiked {
            // User just liked the post
            newCount = min(currentCount + 1, maxCount)
        } else {
            // User just unliked the post
            newCount = max(currentCount - 1, minCount)
        }
        
        // Update UI immediately (optimistic update)
        updateLikeCountUI(isLiked: isLiked, count: newCount)
        
        let endpoint = isLiked ? IVSReelsEndpoints.likeUser : IVSReelsEndpoints.unlikeUser
        let request = IVSAPIRequest(endPoint: endpoint, requestBody: SocialContent(userId: IVSKit.getUserId(), postId: data.postId))

        IVSAPIManager.sendRequest(request: request) { [weak self] (result: IVSResult<SocialResult, IVSReelsAPIError>) in
            guard let self = self else { return }
            
            // Reset pending flag
            self.isPendingLikeRequest = false
            
            switch result {
            case .success(let responseData, _):
                print("Like API Success: \(responseData)")
                DispatchQueue.main.async {
                    self.likesButton.isUserInteractionEnabled = true
                    // Success - keep the optimistic update
                }
            case .failure(let error):
                print("Like API Error: \(error)")
                DispatchQueue.main.async {
                    // Revert everything on failure
                    self.isLiked = currentLikeState
                    self.updateLikeCountUI(isLiked: self.isLiked, count: currentCount)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.likesButton.isUserInteractionEnabled = true
                }
            }
        }
    }

    private func updateLikeCountUI(isLiked: Bool, count: Int){
        // Update UI elements
        self.likesCount.setTitle("\(count)", for: .normal)
        self.likesButton.setImage(self.isLiked ? UIImage(resource: .ivslike) : UIImage(resource: .unLike), for: .normal)
        
        // Update data model with the new count
        self.data.updateLikesCount(isliked: self.isLiked, likesCount: count)
    }
    
    
    /// Action performed when liews Button is tapped
    @objc func viewsTapped(){
        print("Views Tapped")
        if !IVSKit.getIsGuestUser() {
            if data.isPurchased || !data.isPaid || data.userId == IVSKit.getUserId() || data.postAmount == 0{
                IVSReelsUtility.postOpenViewersView(postID: data.postId ?? "")
            }else{
                //show alert
                print("Post needs to be unlocked first to enable custom action")
                DispatchQueue.main.async { [weak self] in
                    self?.showAlert()
                }
            }
        }else{
            //open login screen
            IVSReelsUtility.postOpenLoginScreen()
        }
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Notice", message: "Post needs to be unlocked first to enable custom action", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if let topVC = UIApplication.shared.windows.first?.rootViewController {
            topVC.present(alert, animated: true, completion: nil)
        }
    }

    /// Action performed when comments Button is tapped
    @objc func commentsTapped(){
        print("Comments Tapped")
        if data.isPurchased || !data.isPaid {
            IVSReelsUtility.postOpenCommentsView(commentsAllowed: data.allowComments ?? true, commentsCount: data.commentsCount, viewsCount: data.viewsCount, likesCount: data.likesCount, isPurchased: data.isPurchased, isPaid: data.isPaid, postId: data.postId ?? "", userId: data.userId)
        }else{
            //show alert
            print("Post needs to be unlocked first to enable custom action")
            DispatchQueue.main.async { [weak self] in
                self?.showAlert()
            }
        }
        
    }
    /// Action performed when share Button is tapped
    @objc func shareTapped(){
        print("Share Tapped")
        if data.isPurchased || !data.isPaid {
            IVSReelsUtility.postOpenShareViewController(postID: data.postId ?? "", postUserName: data.name, postUserID: data.userId, isPurchased: data.isPurchased, isPaid: data.isPaid, thumbnailUrl: data.imageUrl, imageUrl: data.imageUrl, postTitle: data.caption, mediaType: data.mediaType)
        }else{
            //show alert
            print("Post needs to be unlocked first to enable custom action")
            DispatchQueue.main.async { [weak self] in
                self?.showAlert()
            }
        }
    }
    /// Action performed when More Button is tapped
    @objc func moreTapped(){
        print("More Tapped")
        if !IVSKit.getIsGuestUser() {
            IVSReelsUtility.postOpenMediaOptionsView(data:
                    .init(postID: data.postId, userId: data.userId, imageUrl: data.imageUrl, thumbnailUrl: data.imageUrl, isBookmarked: data.isBookMarked, username: data.name, viewsCount: data.viewsCount, mediaType: data.mediaType, captions: data.caption, imageUrlWidth: data.imageUrlWidth, allowDownload: data.allowDownload, profilePic: data.profilePic, ispurchased: data.isPurchased, musicId: data.musicData?._id , postAmount : data.postAmount , susbcriptionAmount : data.subscriptonAmount))
        }
        else{
            IVSReelsUtility.postOpenLoginScreen()
        }
    }
}
