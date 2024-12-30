//
//  ISMReelsDataSource.swift
//  ISM
//
//  Created by 3embed on 20/12/24.
//
import Foundation
import IGListKit

class ISMReelsDataSource: NSObject,ListAdapterDataSource{
    var reels = [ISMReels]()

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return reels
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ISMReelsSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    func updateFeeds(reels : [ISMReels]){
        self.reels = reels
        print(reels)
    }
 
    
 
}
