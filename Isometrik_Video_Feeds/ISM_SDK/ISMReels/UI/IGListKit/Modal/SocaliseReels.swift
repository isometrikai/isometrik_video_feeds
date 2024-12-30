//
//  SocaliseReels.swift
//  ISM
//
//  Created by 3embed on 20/12/24.
//

import Foundation
import IGListKit

class ISMReels : ListDiffable{
    private var identifier : String = UUID().uuidString
    private(set) var name : String
    private(set) var ImageUrl : String
    private(set) var mediaType : Int
    
    init(name: String , ImageUrl : String , mediaType : Int) {
        self.name = name
        self.ImageUrl = ImageUrl
        self.mediaType = mediaType
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ISMReels else{
            return false
        }
        
        return self.identifier == object.identifier
    }
    
    
}
