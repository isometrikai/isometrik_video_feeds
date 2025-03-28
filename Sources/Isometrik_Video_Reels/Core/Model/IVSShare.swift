//
//  IVSShare.swift
//  PicoAdda
//
//  Created by 3embed on 05/02/25.
//  Copyright © 2025 Rahul Sharma. All rights reserved.
//

import Foundation

public struct IVSInterfaceMedia {
    public let postID : String?
    public let userId : String?
    public let imageUrl : String?
    public let thumbnailUrl : String?
    public let isBookmarked : Bool?
    public let username : String?
    public let viewsCount : Int?
    public let mediaType : Int?
    public let captions : String?
    public let imageUrlWidth : String?
    public let allowDownload : Bool?
    public let profilePic : String?
    public let ispurchased : Bool?
    public let musicId : String?
    public var postAmount : Double? = 0.0
    public var susbcriptionAmount : Double? = 0.0
    
}

public struct IVSMediaData : Codable {
    public let _id, artist: String?
    public let audioStatus: Int?
    public let audioStatusText: String?
    public let createdOn, duration: Double?
    public let imageUrl: String?
    public let name: String?
    public let path: String?
    public let sequenceId: Int?
    public let songBackground: String?
    public let isOriginalSound: Bool?
}

public struct IVSEditProfileData {
    public let ispaid : Bool?
    public let caption : String?
    public let postAmount : Double?
    public let allowComments : Bool?
    public let allowDownload : Bool?
    
    public init(ispaid: Bool?, caption: String?, postAmount: Double?, allowComments: Bool?, allowDownload: Bool?) {
        self.ispaid = ispaid
        self.caption = caption
        self.postAmount = postAmount
        self.allowComments = allowComments
        self.allowDownload = allowDownload
    }
}
