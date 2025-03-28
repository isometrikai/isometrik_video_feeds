//
//  PopularUser.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 14/01/25.
//

import Foundation

struct PopularUser : Codable{
    let message : String?
    let data : [PopularUserContent]?
}

struct PopularUserContent : Codable{
    let _id : String?
    let score : Double?
    let user_id : String?
    let number : String?
    let countryCode : String?
    let userName : String?
    let firstName : String?
    let lastName : String?
    let email : String?
    let profilePic : String?
    let profileCoverImage : String?
    let status : Int?
    let countryName : String?
    let follow : String?
    let starCategoryName : String?
    let starUserKnownBy : String?
    let followStatus : Int?
}
