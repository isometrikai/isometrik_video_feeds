//
//  PostFeeds.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 25/12/24.
//

import Foundation

// MARK: - FeedsPosts
class FeedsPosts: Codable {
    let mesage: String?
    let totalPosts: Int?
    let data: [Content]?

    init(mesage: String?, totalPosts: Int?, data: [Content]?) {
        self.mesage = mesage
        self.totalPosts = totalPosts
        self.data = data
    }
}

// MARK: - Datum
class Content: Codable{
    let id: String?
    let postViewsCount: Int?
    let title: String?
    let imageUrl1: String?
    let thumbnailUrl1: String?
    let mediaType1: Int?
    let userID, createdOn: String?
    let timeStamp, distinctViews: Int?
    let imageUrl1Width, imageUrl1Height: String?
    let likesCount: Int?
    let postStatus, shareCount, commentCount: Int?
    let cloudinaryPublicID, userName, firstName, lastName: String?
    let fullName, fullNameWithSpace: String?
    let profilepic: String?
    let profileCoverImage: String?
    let categoryID, categoryName: String?
    let categoryURL: String?
    let musicID: String?
    let musicData: MusicData?
    let location: Location?
    let place: String?
    let placeID: String?
    let orientation: Int?
    let isStar: Bool?
    let trendingScore: Int?
    let allowDownload, allowComment, allowDuet: Bool?
    let latForPost, longForPost: Double?
    let locationForPost: LocationForPost?
    let isPrivate: Int?
    let isPaid: Bool?
    let postAmount, subscriptionAmount, tipsAmount: Int?
    let hashTags: [String]?
    let followStatus: Int?
    let postID: String?
    let liked, isPurchased, isKYCApproved, isBookMarked: Bool?


    init(id: String?, postViewsCount: Int?, title: String?, imageUrl1: String?, thumbnailUrl1: String?, mediaType1: Int?, userID: String?, createdOn: String?, timeStamp: Int?, distinctViews: Int?, imageUrl1Width: String?, imageUrl1Height: String?, likesCount: Int?, postStatus: Int?, shareCount: Int?, commentCount: Int?, cloudinaryPublicID: String?, userName: String?, firstName: String?, lastName: String?, fullName: String?, fullNameWithSpace: String?, profilepic: String?, profileCoverImage: String?, categoryID: String?, categoryName: String?, categoryURL: String?, musicID: String?, musicData: MusicData?, location: Location?, place: String?, placeID: String?, orientation: Int?, isStar: Bool?, trendingScore: Int?, allowDownload: Bool?, allowComment: Bool?, allowDuet: Bool?, cityForPost: String?, latForPost: Double?, longForPost: Double?, locationForPost: LocationForPost?, isPrivate: Int?, isPaid: Bool?, postAmount: Int?, subscriptionAmount: Int?, tipsAmount: Int?, hashTags: [String]?, followStatus: Int?, postID: String?, liked: Bool?, isPurchased: Bool?, isKYCApproved: Bool?, isBookMarked: Bool?) {
        self.id = id
        self.postViewsCount = postViewsCount
        self.title = title
        self.imageUrl1 = imageUrl1
        self.thumbnailUrl1 = thumbnailUrl1
        self.mediaType1 = mediaType1
        self.userID = userID
        self.createdOn = createdOn
        self.timeStamp = timeStamp
        self.distinctViews = distinctViews
        self.imageUrl1Width = imageUrl1Width
        self.imageUrl1Height = imageUrl1Height
        self.likesCount = likesCount
        self.postStatus = postStatus
        self.shareCount = shareCount
        self.commentCount = commentCount
        self.cloudinaryPublicID = cloudinaryPublicID
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
        self.fullNameWithSpace = fullNameWithSpace
        self.profilepic = profilepic
        self.profileCoverImage = profileCoverImage
        self.categoryID = categoryID
        self.categoryName = categoryName
        self.categoryURL = categoryURL
        self.musicID = musicID
        self.musicData = musicData
        self.location = location
        self.place = place
        self.placeID = placeID
        self.orientation = orientation
        self.isStar = isStar
        self.trendingScore = trendingScore
        self.allowDownload = allowDownload
        self.allowComment = allowComment
        self.allowDuet = allowDuet
        self.latForPost = latForPost
        self.longForPost = longForPost
        self.locationForPost = locationForPost
        self.isPrivate = isPrivate
        self.isPaid = isPaid
        self.postAmount = postAmount
        self.subscriptionAmount = subscriptionAmount
        self.tipsAmount = tipsAmount
        self.hashTags = hashTags
        self.followStatus = followStatus
        self.postID = postID
        self.liked = liked
        self.isPurchased = isPurchased
        self.isKYCApproved = isKYCApproved
        self.isBookMarked = isBookMarked
    }
}

// MARK: - Location
class Location: Codable{
    let longitude, latitude: Double?
    init(longitude: Double?, latitude: Double?) {
        self.longitude = longitude
        self.latitude = latitude
    }
}

// MARK: - LocationForPost
class LocationForPost: Codable{
    let lat, lon: Double?
    init(lat: Double?, lon: Double?) {
        self.lat = lat
        self.lon = lon
    }
}

// MARK: - MusicData
class MusicData: Codable{
    let id, artist: String?
    let audioStatus: Int?
    let audioStatusText: String?
    let createdOn, duration: Int?
    let imageURL: String?
    let name: String?
    let path: String?
    let sequenceID: Int?
    let songBackground: String?
    let isOriginalSound: Bool?


    init(id: String?, artist: String?, audioStatus: Int?, audioStatusText: String?, createdOn: Int?, duration: Int?, imageURL: String?, name: String?, path: String?, sequenceID: Int?, songBackground: String?, isOriginalSound: Bool?) {
        self.id = id
        self.artist = artist
        self.audioStatus = audioStatus
        self.audioStatusText = audioStatusText
        self.createdOn = createdOn
        self.duration = duration
        self.imageURL = imageURL
        self.name = name
        self.path = path
        self.sequenceID = sequenceID
        self.songBackground = songBackground
        self.isOriginalSound = isOriginalSound
    }
}

