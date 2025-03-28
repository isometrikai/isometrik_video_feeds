//
//  ISMPopularUser.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 14/01/25.
//

import Foundation
import IGListKit

class ISMPopularUser : ListDiffable {
    private var identifier: String = UUID().uuidString
    private(set) var data: [ISMPopularUserContent]?
    
    init(identifier: String, data: [ISMPopularUserContent]? = nil) {
        self.identifier = identifier
        self.data = data
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: (any ListDiffable)?) -> Bool {
        guard let object = object as? ISMPopularUser else{
            return false
        }
        
        return self.identifier == object.identifier && self.data == object.data
    }
    
}

class ISMPopularUserContent : ListDiffable , Equatable{
    private var id: String
    private(set) var username : String
    private(set) var name : String
    private(set) var profileImageUrl : String
    private(set) var followStatus : Int
    private(set) var userId : String
    
    init(id: String, username: String, name: String, profileImageUrl: String , followStatus: Int, userId: String) {
        self.id = id
        self.username = username
        self.name = name
        self.profileImageUrl = profileImageUrl
        self.followStatus = followStatus
        self.userId = userId
    }
    
    func diffIdentifier() -> any NSObjectProtocol {
        return id as NSString
    }
    
    func isEqual(toDiffableObject object: (any ListDiffable)?) -> Bool {
        guard let object = object as? ISMPopularUserContent else{
            return false
        }
        
        return id == object.id && username == object.username && name == object.name && profileImageUrl == object.profileImageUrl && followStatus == object.followStatus && userId == object.userId
    }
    
    static func == (lhs: ISMPopularUserContent, rhs: ISMPopularUserContent) -> Bool {
        lhs.username == rhs.username && lhs.name == rhs.name && lhs.profileImageUrl == rhs.profileImageUrl && lhs.followStatus == rhs.followStatus && lhs.userId == rhs.userId
    }
        
    func updateFollowStatus(followStatus : Int ) {
        self.followStatus = followStatus
    }
    
}
