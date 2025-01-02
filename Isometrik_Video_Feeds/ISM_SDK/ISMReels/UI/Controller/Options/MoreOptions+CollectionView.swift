//
//  MoreOptions+CollectionView.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 31/12/24.
//

import Foundation
import UIKit

extension ISMReelsMoreOptionsViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mediaOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ISMReelsOptionsCollectionViewCell.identifier, for: indexPath) as? ISMReelsOptionsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(option: mediaOptions[indexPath.item], color: chooseRandomColor())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width  / 3.5
        return CGSize(width: width, height: width)
    }
}

