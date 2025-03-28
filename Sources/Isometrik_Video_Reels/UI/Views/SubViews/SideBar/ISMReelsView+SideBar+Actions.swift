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
    @objc func likeTapped(){
       
        if !IVSKit.getIsGuestUser() {
            if data.isPurchased || !data.isPaid {
                isLiked.toggle()
                print( isLiked ? "like Tapped" : "Unlike Tapped")
                likesButton.setImage(isLiked ? UIImage(resource: .ivslike) : UIImage(resource: .unLike), for:  .normal)
                
                var value = (isLiked ? data.likesCount + 1 : data.likesCount - 1)
                
                likesCount.setTitle("\(value)", for: .normal)
                if value < 0 {
                    value = 0
                    likesCount.setTitle("0", for: .normal)
                }
                
                
                print("--------------------------------------")
                print("data.likesCount : \(data.likesCount)")
                print("Is liked : \(isLiked ?? false) , value : \(value) ")
                print("--------------------------------------")
                
                
                let request = IVSAPIRequest(endPoint: isLiked ? IVSReelsEndpoints.likeUser : IVSReelsEndpoints.unlikeUser, requestBody: SocialContent(userId: IVSKit.getUserId(), postId: data.postId ))
                
                IVSAPIManager.sendRequest(request: request) {[weak self] (result : IVSResult<SocialResult,IVSReelsAPIError>)  in
                    guard let self = self else {return}
                    switch result {
                    case .success(let data , _):
                        print(data)
                        DispatchQueue.main.async {
                            self.data.updateLikesCount(isliked: self.isLiked, likesCount: value)
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }else {
                print("Post needs to be unlocked first to enable custom action")
                DispatchQueue.main.async {[weak self] in
                    self?.showAlert()
                }
            }
        }else {
            IVSReelsUtility.postOpenLoginScreen()
        }
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
