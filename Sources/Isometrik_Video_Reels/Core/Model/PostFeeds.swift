//
//  PostFeeds.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 25/12/24.
//

import Foundation

// MARK: - FeedsPosts
struct FeedsPosts: Codable {
    let mesage: String?
    let totalPosts: Int?
    let data: [Content]?
}

// MARK: - Datum
struct Content: Codable{
    let id: String?
    let postViewsCount: Int?
    let title: String?
    let imageUrl1: String?
    let thumbnailUrl1: String?
    let mediaType1: Int?
    let userId, createdOn: String?
    let timeStamp : Double?
    let distinctViews: Int?
    let imageUrl1Width, imageUrl1Height: String?
    let likesCount: Int?
    let postStatus, shareCount, commentCount: Int?
    let cloudinaryPublicID, userName, firstName, lastName: String?
    let fullName, fullNameWithSpace: String?
    let profilepic: String?
    let profileCoverImage: String?
    let categoryID, categoryName: String?
    let categoryURL: String?
    let musicId: String?
    let musicData: MusicData?
    let location: IVSLocation?
    let place: String?
    let placeId: String?
//    let orientation: Int?
    let isStar: Bool?
    let trendingScore: Int?
    let allowDownload, allowComment, allowDuet: Bool?
//    let latForPost, longForPost: Double?
    let locationForPost: LocationForPost?
    let isPrivate: Int?
    let isPaid: Bool?
    let tipsAmount: Int?
    let subscriptionAmount , postAmount : Double?
//    let hashTags: [String?]?
    let followStatus: Int?
    let postId: String?
    let liked, isPurchased, isKYCApproved, isBookMarked: Bool?
}

// MARK: - Location
struct IVSLocation: Codable{
    let longitude, latitude: Double?
}

// MARK: - LocationForPost
struct LocationForPost: Codable{
    let lat, lon: Double?
}

// MARK: - MusicData
struct MusicData: Codable{
    let _id, artist: String?
    let audioStatus: Int?
    let audioStatusText: String?
    let createdOn, duration: Double?
    let imageUrl: String?
    let name: String?
    let path: String?
    let sequenceId: Int?
    let songBackground: String?
    let isOriginalSound: Bool?
}

