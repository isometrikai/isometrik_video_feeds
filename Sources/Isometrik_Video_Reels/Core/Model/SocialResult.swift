//
//  SocialResult.swift
//  PicoAdda
//
//  Created by 3embed on 04/02/25.
//  Copyright © 2025 Rahul Sharma. All rights reserved.
//

import Foundation

struct SocialResult: Codable {
    var message: String?
    var data: SocialData?
}

struct SocialData : Codable {
    var likesCount : Int?
}

struct SocialContent : Codable {
    var userId : String?
    var postId: String?
}
