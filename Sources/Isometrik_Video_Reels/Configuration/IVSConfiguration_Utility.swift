//
//  IVSConfiguration_Utility.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 21/01/25.
//

import Foundation
import UIKit

// MARK: - Private Implementation

extension IVSKit {
    func createReelsViewController() -> UIViewController {
        let reelsVC = ISMReelsViewController()
        reelsVC.configDelegate = delegate
        return reelsVC
    }
    
    func createFeedsViewController() -> UIViewController {
        // Implementation...
        return UIViewController()
    }
    
    func createTwitterViewController() -> UIViewController {
        // Implementation...
        return UIViewController()
    }
    
   
}

// MARK: - Theming

public struct IVSTheme {
    public var themeColor: UIColor = UIColor(resource: .soAppBase)
    
    public init(themeColor: UIColor) {
        self.themeColor = themeColor
    }
}
/// Configuration options for ISMKit
public struct IVSFeedsConfiguration {
    public let isGuestUser : Bool
    public let bearerToken: String
    public var walletPrice : String
    public let baseUrl: String?
    public let trendingApi: String?
    public let popularApi: String?
    public let followingApi: String?
    public let exclusiveApi: String?
    public let guestApi: String?
    public let environment: IVSEnvironment
    public let theme: IVSTheme?
    public let userId : String
    public let username : String
    public let likeApi : String?
    public let unlikeApi : String?
    public let countForAds : Int?
    
    public init(isGuestUser : Bool,bearerToken: String, walletPrice : String,userId : String,username : String,baseUrl: String? = nil,trendingApi: String? = nil, popularApi: String? = nil,followingApi: String? = nil,exclusiveApi: String? = nil,guestApi: String? = nil,environment: IVSEnvironment = .production,theme: IVSTheme? = nil,likeApi : String? = nil , unlikeApi : String? = nil, countforAds : Int? = nil) {
        self.bearerToken = bearerToken
        self.walletPrice = walletPrice
        self.baseUrl = baseUrl
        self.trendingApi = trendingApi
        self.popularApi = popularApi
        self.followingApi = followingApi
        self.exclusiveApi = exclusiveApi
        self.environment = environment
        self.theme = theme
        self.userId = userId
        self.isGuestUser = isGuestUser
        self.guestApi = guestApi
        self.username = username
        self.likeApi = likeApi
        self.unlikeApi = unlikeApi
        self.countForAds = countforAds
        
    }
}

struct IVSDefaultSettings{
    //MARK: - Urls
    static let defaultBaseUrl = "https://api.livejet.app/"
    static let defaultTrendingPostsApi = "v2/trendingPosts/"
    static let defaultPopularUserApi = "v2/popularUser/"
    static let defaultFollowingApi = "v1/home"
    static let defaultExclusivePostsApi = "v2/xclusivePosts/"
    static let defaultGuestApi = "v2/guestPosts/"
    static let defaultLikeApi = "v1/like"
    static let defaultUnlikeApi = "v1/unlike"
    
    //MARK: - Fonts
    static let defaultRegular = UIFont.systemFont(ofSize: 16 , weight: .regular)
    static let defaultMedium = UIFont.systemFont(ofSize: 16, weight: .medium)
    static let defaultSemibold = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let defaultBold = UIFont.systemFont(ofSize: 16, weight: .bold)
    
    //MARK: - Values
    static let walletDefaultValue = "0"
}


