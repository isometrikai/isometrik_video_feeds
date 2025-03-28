//
//  IVSShare.swift
//  PicoAdda
//
//  Created by 3embed on 05/02/25.
//  Copyright © 2025 Rahul Sharma. All rights reserved.
//

import Foundation

public struct IVSInterfaceMedia {
    let postID : String?
    let userId : String?
    let imageUrl : String?
    let thumbnailUrl : String?
    let isBookmarked : Bool?
    let username : String?
    let viewsCount : Int?
    let mediaType : Int?
    let captions : String?
    let imageUrlWidth : String?
    let allowDownload : Bool?
    let profilePic : String?
    let ispurchased : Bool?
    let musicId : String?
    var postAmount : Double? = 0.0
    var susbcriptionAmount : Double? = 0.0
    
}

public struct IVSMediaData : Codable {
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

public struct IVSEditProfileData {
    let ispaid : Bool?
    let caption : String?
    let postAmount : Double?
    let allowComments : Bool?
    let allowDownload : Bool?
}
