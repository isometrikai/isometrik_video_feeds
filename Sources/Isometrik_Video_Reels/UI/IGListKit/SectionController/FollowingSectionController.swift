//
//  FollowingSectionController.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 14/01/25.
//

import Foundation
import IGListKit

class ISMFollowingSectionController: ListSectionController , CompositionLayoutCapable {
    var currentPopularUser : ISMPopularUser?
    
    override func didUpdate(to object: Any) {
        guard let user = object as? ISMPopularUser else {
            return
        }
        currentPopularUser = user
    }
    
    override func numberOfItems() -> Int {
        return currentPopularUser?.data?.count ?? 0
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell : UICollectionViewCell = UICollectionViewCell()
        guard let currentPopularUser = currentPopularUser else {return cell}

        let storyCell = collectionContext.dequeueReusableCell(of: ISMReelsFollowingCollectionViewCell.self, withReuseIdentifier: ISMReelsFollowingCollectionViewCell.identifier, for: self, at: index)
        
        guard let storyCell = storyCell as? ISMReelsFollowingCollectionViewCell else {
            return cell
        }
        if let data = currentPopularUser.data?[index] {
            storyCell.setUpCell(data: data)
            return storyCell
        }
        return UICollectionViewCell()
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        // Size handled by cell
        return CGSizeZero
    }
    
    
    
    func collectionViewSectionLayout(layoutEnvironment: any NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        //Item
        let item = IVSCompositionalLayoutManager.createItem(width: .fractionalWidth(1.0), height: .fractionalHeight(1.0), spacing: 10)
        
        //Group
        let group = IVSCompositionalLayoutManager.createGroup(layoutDirection: .horizontal, width: .fractionalWidth(0.45), height: .fractionalHeight(0.9), items: [item])
        
        //section
        let section = IVSCompositionalLayoutManager.createSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }
    
    
    
}
