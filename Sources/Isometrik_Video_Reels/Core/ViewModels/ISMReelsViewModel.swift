//
//  ISMReelsViewModel.swift
//  ISM
//
//  Created by 3embed on 18/12/24.
//

import Foundation

/// Responsible for fetching data for the ISMReels Page
class ISMReelsViewModel{
    /// Stores the posts for Reels Page
    var reels = [ISMReels]()
    var exclusiveReels = [ISMReels]()
    var homeReels = [ISMReels]()
    var popularUser = [ISMPopularUserContent]()

    var offset = 0
    var limit = 20
    var isFetchMore = true
    
    var exclusiveOffset = 0
    var exclusiveLimit = 20
    var exclusiveIsFetchMore = true
    
    var homeOffset = 0
    var homeLimit = 20
    var homeIsFetchMore = true
    

    func fetchPopularUserContent(success : @escaping() -> () , failure : @escaping (IVSErrorMessage) -> ()){
        let endPoint = IVSReelsEndpoints.popular(userId: IVSKit.getUserId())
        let request = IVSAPIRequest<Any>(endPoint: endPoint, requestBody: nil)
        
        IVSAPIManager.sendRequest(request: request) { [weak self] (result : IVSResult<PopularUser,IVSReelsAPIError>)  in
            guard let self = self else { return }
            switch result {
            case .success(let decodedResponse, _):
                if let decodedResponseData = decodedResponse.data{
                    for values in decodedResponseData{
                        self.popularUser.append(ISMPopularUserContent(
                            id: values._id ?? "",
                            username: values.userName ?? "",
                            name: values.firstName ?? "",
                            profileImageUrl: values.profilePic ?? "",
                            followStatus: values.followStatus ?? 0,
                            userId: values.user_id ?? ""))
                        
                    }
                    DispatchQueue.main.async {
                        success()
                    }
                }
            case .failure(let error):
                print("\(error)")
                failure(IVSErrorMessage(error: "Failed", errorCode: 412))
            }
        }
    
    }
    
    func fetchExclusiveContent(offset : Int,success : @escaping() -> () , failure : @escaping (IVSErrorMessage) -> ()){
        let endPoint = IVSReelsEndpoints.exclusive(offset: offset, limit: exclusiveLimit)
        let request = IVSAPIRequest<Any>(endPoint: endPoint, requestBody: nil)
        
        IVSAPIManager.sendRequest(request: request) { [weak self] (result : IVSResult<FeedsPosts,IVSReelsAPIError>)  in
            guard let self = self else { return }
            switch result {
            case .success(let decodedResponse, _):
                if let decodedResponseData = decodedResponse.data {
                    if decodedResponseData.count < self.exclusiveLimit{
                        self.exclusiveIsFetchMore = false
                        self.exclusiveOffset = 0
                    }
                    for values in decodedResponseData{
                        exclusiveReels.append(ISMReels(name: values.userName ?? "",
                                                       imageUrl: values.imageUrl1 ?? "",
                                                       mediaType: values.mediaType1 ?? 0,
                                                       date: Int64(values.timeStamp ?? 0),
                                                       otherUserProfileImageUrl : values.imageUrl1 ?? "",
                                                       caption: values.title ?? "",
                                                       isStar: values.isStar ?? false,
                                                       allowComments: values.allowComment ?? false,
                                                       ispaid: values.isPaid ?? true,
                                                       isfollow: (values.followStatus == 1 ? true : false),
                                                       musicData: values.musicData,
                                                       subscriptonAmount: values.subscriptionAmount,
                                                       likesCount: values.likesCount ?? 0,
                                                       commentsCount: values.commentCount ?? 0,
                                                       viewsCount: values.distinctViews ?? 0,
                                                       userId: values.userId ?? "",
                                                       isPurchased: values.isPurchased ?? false,
                                                       postAmount: values.postAmount ?? 0,
                                                       postId: values.postId ?? "",
                                                       liked : values.liked ?? false,
                                                       isBookMarked : values.isBookMarked ?? false,
                                                       profilePic : values.profilepic ?? "",
                                                       allowDownload : values.allowDownload ?? false,
                                                       imageUrlWidth : values.imageUrl1Width ?? "0",
                                                       categoryName : values.categoryName ?? "",
                                                       place : values.place ?? "",
                                                       placeId : values.placeId ?? "",
                                                       latitude : values.location?.latitude ?? 0,
                                                       longitude : values.location?.longitude ?? 0
                                                    
                                                      ))
                        
                    }
                    DispatchQueue.main.async {
                        self.exclusiveOffset = self.exclusiveReels.count
                        success()
                    }
                }
            case .failure(let error):
                print("\(error)")
                failure(IVSErrorMessage(error: "Failed", errorCode: 412))
            }
        }
    
    }
    
    func fetchReelsContent(offset : Int,success : @escaping() -> () , failure : @escaping (IVSErrorMessage) -> ()){
        let endPoint = IVSKit.getIsGuestUser() ? IVSReelsEndpoints.guestFlow(offset: offset, limit: limit, randomNumber: Int.random(in: 0..<1000000000)) : IVSReelsEndpoints.trending(offset: offset, limit: self.limit)
        let request = IVSAPIRequest<Any>(endPoint: endPoint, requestBody: nil)
        
        IVSAPIManager.sendRequest(request: request) { [weak self] (result : IVSResult<FeedsPosts,IVSReelsAPIError>)  in
            guard let self = self else { return }
            switch result {
            case .success(let decodedResponse, _):
                if let decodedResponseData = decodedResponse.data{
                    if decodedResponseData.count < self.limit{
                        self.isFetchMore = false
                        self.offset = 0
                    }
                    for values in decodedResponseData{
                        reels.append(ISMReels(name: values.userName ?? "",
                                              imageUrl: values.imageUrl1 ?? "",
                                              mediaType: values.mediaType1 ?? 0,
                                              date: Int64(values.timeStamp ?? 0),
                                              otherUserProfileImageUrl : values.imageUrl1 ?? "",
                                              caption: values.title ?? "",
                                              isStar: values.isStar ?? false,
                                              allowComments: values.allowComment ?? false,
                                              ispaid: values.isPaid ?? true,
                                              isfollow: (values.followStatus == 1 ? true : false),
                                              musicData: values.musicData,
                                              subscriptonAmount: values.subscriptionAmount,
                                              likesCount: values.likesCount ?? 0,
                                              commentsCount: values.commentCount ?? 0,
                                              viewsCount: values.distinctViews ?? 0,
                                              userId: values.userId ?? "",
                                              isPurchased: values.isPurchased ?? false,
                                              postAmount: values.postAmount ?? 0,
                                              postId: values.postId ?? "",
                                              liked : values.liked ?? false,
                                              isBookMarked : values.isBookMarked ?? false,
                                              profilePic : values.profilepic ?? "",
                                              allowDownload : values.allowDownload ?? false,
                                              imageUrlWidth : values.imageUrl1Width ?? "0",
                                              categoryName : values.categoryName ?? "",
                                              place : values.place ?? "",
                                              placeId : values.placeId ?? "",
                                              latitude : values.location?.latitude ?? 0,
                                              longitude : values.location?.longitude ?? 0
                                             ))
                        
                    }
                    DispatchQueue.main.async {
                        self.offset = self.reels.count
                        success()
                    }
                }
            case .failure(let error):
                print("\(error)")
                switch error {
                case .tokenExpired :
                    DispatchQueue.main.async {
//                        Utility.logOut()
                    }
                default :
                    failure(IVSErrorMessage(error: "Failed", errorCode: 412))
                }
                
               
            }
        }
    
    }
    
    func fetchHomeContent(offset : Int,success : @escaping() -> () , failure : @escaping (IVSErrorMessage) -> ()){
        let endPoint = IVSReelsEndpoints.following(offset: offset, limit: homeLimit)
        let request = IVSAPIRequest<Any>(endPoint: endPoint, requestBody: nil)
        
        IVSAPIManager.sendRequest(request: request) { [weak self] (result : IVSResult<FeedsPosts,IVSReelsAPIError>)  in
            guard let self = self else { return }
            switch result {
            case .success(let decodedResponse, _):
                if let decodedResponseData = decodedResponse.data{
    
                    if decodedResponseData.count < self.homeLimit{
                        self.homeIsFetchMore = false
                        self.homeOffset = 0
                    }
                    
                    for values in decodedResponseData{
                        homeReels.append(ISMReels(name: values.userName ?? "",
                                                  imageUrl: values.imageUrl1 ?? "",
                                                  mediaType: values.mediaType1 ?? 0,
                                                  date: Int64(values.timeStamp ?? 0),
                                                  otherUserProfileImageUrl : values.imageUrl1 ?? "",
                                                  caption: values.title ?? "",
                                                  isStar: values.isStar ?? false,
                                                  allowComments: values.allowComment ?? false,
                                                  ispaid: values.isPaid ?? true,
                                                  isfollow: (values.followStatus == 1 ? true : false),
                                                  musicData: values.musicData,
                                                  subscriptonAmount: values.subscriptionAmount,
                                                  likesCount: values.likesCount ?? 0,
                                                  commentsCount: values.commentCount ?? 0,
                                                  viewsCount: values.distinctViews ?? 0,
                                                  userId: values.userId ?? "",
                                                  isPurchased: values.isPurchased ?? false,
                                                  postAmount: values.postAmount ?? 0,
                                                  postId: values.postId ?? "",
                                                  liked : values.liked ?? false,
                                                  isBookMarked : values.isBookMarked ?? false,
                                                  profilePic : values.profilepic ?? "",
                                                  allowDownload : values.allowDownload ?? false,
                                                  imageUrlWidth : values.imageUrl1Width ?? "0",
                                                  categoryName : values.categoryName ?? "",
                                                  place : values.place ?? "",
                                                  placeId : values.placeId ?? "",
                                                  latitude : values.location?.latitude ?? 0,
                                                  longitude : values.location?.longitude ?? 0
                                                 ))
                        
                    }
                    DispatchQueue.main.async {
                        self.homeOffset = self.homeReels.count
                        success()
                    }
                }
            case .failure(let error):
                print("\(error)")
                failure(IVSErrorMessage(error: "Failed", errorCode: 412))
            }
        }
    
    }
    
}

