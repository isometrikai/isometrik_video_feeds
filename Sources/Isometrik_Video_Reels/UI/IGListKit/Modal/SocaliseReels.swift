//
//  SocaliseReels.swift
//  ISM
//
//  Created by 3embed on 20/12/24.
//

import Foundation
import IGListKit

class ISMReels : ListDiffable , Codable{
    private var identifier : String = UUID().uuidString
    private(set) var name : String
    private(set) var imageUrl : String
    private(set) var mediaType : Int
    private(set) var isPaid : Bool
    private(set) var userId : String
    private(set) var isfollow : Bool
    private(set) var date : Int64
    private(set) var otherUserProfileImageUrl : String
    private(set) var caption : String
    private(set) var isStar : Bool
    private(set) var musicData : MusicData?
    private(set) var subscriptonAmount : Double?
    private(set) var likesCount : Int
    private(set) var commentsCount : Int
    private(set) var viewsCount : Int
    private(set) var postAmount : Double
    private(set) var isPurchased : Bool
    private(set) var postId : String?
    private(set) var allowComments : Bool?
    private(set) var liked : Bool?
    private(set) var isBookMarked : Bool?
    private(set) var profilePic : String?
    private(set) var allowDownload : Bool?
    private(set) var imageUrlWidth : String?
    
    init(name: String , imageUrl : String , mediaType : Int ,date : Int64 ,otherUserProfileImageUrl : String ,caption : String ,isStar : Bool,allowComments : Bool , ispaid : Bool = false , isfollow : Bool , musicData : MusicData? ,subscriptonAmount : Double? ,likesCount : Int , commentsCount : Int , viewsCount : Int,userId : String , isPurchased : Bool , postAmount : Double,postId : String , liked : Bool , isBookMarked : Bool,profilePic : String? , allowDownload : Bool? , imageUrlWidth : String?) {
        self.name = name
        self.imageUrl = imageUrl
        self.mediaType = mediaType
        self.isPaid = ispaid
        self.isfollow = isfollow
        self.date = date
        self.otherUserProfileImageUrl = otherUserProfileImageUrl
        self.caption = caption
        self.isStar = isStar
        self.musicData = musicData
        self.subscriptonAmount = subscriptonAmount
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.viewsCount = viewsCount
        self.userId = userId
        self.isPurchased = isPurchased
        self.postAmount = postAmount
        self.postId = postId
        self.allowComments = allowComments
        self.liked = liked
        self.isBookMarked = isBookMarked
        self.profilePic = profilePic
        self.allowDownload = allowDownload
        self.imageUrlWidth = imageUrlWidth
    }
    
    func setFollowStatus(isfollow : Bool){
        self.isfollow = isfollow 
    }
    
    func updateIsPurchased(isPurchased : Bool) {
        self.isPurchased = isPurchased
    }
    
    func updateBookmarkStatus(isBookMarked : Bool){
        self.isBookMarked = isBookMarked
    }
    
    func updateDataForEditPost(post: IVSEditProfileData) {
        self.caption = post.caption ?? self.caption
        self.allowComments = post.allowComments ?? self.allowComments
        self.allowDownload = post.allowDownload ?? self.allowDownload
        self.isPaid = post.ispaid ?? self.isPaid
        self.postAmount = post.postAmount ?? self.postAmount
    }
    
    
    func updateLikesCount(isliked : Bool,likesCount : Int){
        self.likesCount = likesCount
        self.liked = isliked
    }
  
    func updatecommentsCount(commentsCount : Int){
        self.commentsCount = commentsCount
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ISMReels else{
            return false
        }
        
        return (self.identifier == object.identifier || self.caption == object.caption)
    }
    
    
}
