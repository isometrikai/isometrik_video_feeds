//
//  ISMReelsSectionController.swift
//  ISM
//
//  Created by 3embed on 20/12/24.
//

import Foundation
import IGListKit
import SwiftUI
class ISMReelsSectionController : ListSectionController , CompositionLayoutCapable{
    private var currentPostData : ISMReels?
    override func didUpdate(to object: Any) {
        guard let post = object as? ISMReels else {
            return
        }
        currentPostData = post
        self.scrollDelegate = self
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext else { fatalError() }
        let cell = context.dequeueReusableCell(of: ISMReelsCollectionViewCell.self, for: self, at: index)
        guard let postCell = cell as? ISMReelsCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let currentPostData = currentPostData{
            postCell.setUpCell(data: currentPostData )
            return postCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionViewSectionLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        //Item
        let item = CompositionalLayoutManager.createItem(width: .fractionalWidth(1.0), height: .fractionalHeight(1.0), spacing: 0)
        
        //Group
        let group = CompositionalLayoutManager.createGroup(layoutDirection: .vertical, width: .fractionalWidth(1.0), height: .fractionalHeight(1.0), items: [item])
        
        //section
        let section = CompositionalLayoutManager.createSection(group: group)
        return section
    }
    
}

extension ISMReelsSectionController : ListScrollDelegate{
    func listAdapter(_ listAdapter: ListAdapter, didScroll sectionController: ListSectionController) {
        guard let collectionView = listAdapter.collectionView else { return }
        
        for case let cell as ISMReelsCollectionViewCell in collectionView.visibleCells {
            let cellRect = collectionView.convert(cell.frame, to: collectionView.superview)
            let intersect = cellRect.intersection(collectionView.frame)
            let visibleHeight = intersect.height
            let totalHeight = cell.frame.height
            let visibilityRatio = visibleHeight / totalHeight
            
//            print("Cell visibility ratio: \(visibilityRatio)")
            
            if visibilityRatio > 0.7 {
                cell.playVideo()
               
            } else {
                cell.stopVideo()
                
            }
        }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, willBeginDragging sectionController: ListSectionController) {
        //
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDragging sectionController: ListSectionController, willDecelerate decelerate: Bool) {
        //
    }
}
