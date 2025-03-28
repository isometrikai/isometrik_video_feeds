//
//  IVSReelsEndPoints.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 28/01/25.
//

import Foundation

enum IVSReelsEndpoints : IVSURLConvertible {
    case popular(userId : String , offset : Int = 0 , limit : Int = 0)
    case trending(offset : Int , limit : Int)
    case exclusive(offset : Int , limit : Int)
    case following(offset : Int , limit : Int)
    case guestFlow(offset : Int , limit : Int , randomNumber : Int)
    case likeUser
    case unlikeUser
    

    var baseURL: URL{
        return URL(string:IVSKit.getBaseUrl() ?? IVSDefaultSettings.defaultBaseUrl)!
    }
    
    var path: String{
        switch self {
        case .popular :
            return IVSKit.getPopularUserApi() ?? IVSDefaultSettings.defaultPopularUserApi
        case .following :
            return IVSKit.getFollowingApi() ?? IVSDefaultSettings.defaultFollowingApi
        case .trending :
            return IVSKit.getTrendingApi() ?? IVSDefaultSettings.defaultTrendingPostsApi
        case .exclusive :
            return IVSKit.getExclusiveApi() ?? IVSDefaultSettings.defaultExclusivePostsApi
        case .guestFlow :
            return IVSKit.getGuestApi() ?? IVSDefaultSettings.defaultGuestApi
        case .likeUser:
            return IVSKit.getLikesApi() ?? IVSDefaultSettings.defaultLikeApi
        case .unlikeUser :
            return IVSKit.getUnLikeApi() ?? IVSDefaultSettings.defaultUnlikeApi
        }
    }
    
    var method: IVSHTTPMethod{
        switch self {
        case .likeUser , .unlikeUser :
            return .post
        default :
            return .get
        }
        
    }
    
    var queryParams: [String : String]? {
        switch self {
        case .exclusive(let offset, let limit) :
            let params : [String : String] = [
                "set" : "\(offset)",
                "limit" : "\(limit)"
                ]
            return params
        case .popular(let userId, let offset, let limit) :
            let params : [String : String] = [
                "userId" : userId,
                "set" : "\(offset)",
                "skip" : "\(limit)"
            ]
            return params
        case .following(let offset, let limit) :
            let params : [String : String] = [
                "offset" : "\(offset)",
                "limit" : "\(limit)"
                ]
            return params
        case .trending(let offset, let limit) :
            let params : [String : String] = [
                "set" : "\(offset)",
                "limit" : "\(limit)"
                ]
            return params
            
        case .guestFlow(let set,let limit,let randomScore):
            let params : [String : String] = [
                "set" : "\(set)",
                "limit" : "\(limit)",
                "randomScore": "\(randomScore)"]
            return params
        default :
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default :
            return [
                "Authorization" : IVSKit.getUserToken()
            ]
        }
    }
    
    
}
