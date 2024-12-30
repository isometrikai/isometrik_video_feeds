//
//  ISMReelsViewController+NotificationObservers.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation
import UIKit

extension ISMReelsViewController{
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(scrollToNextCell), name: .scrollToNextVideo, object: nil)
        NotificationCenter.default.addObserver(
              self,
              selector: #selector(playMostVisibleCellVideo),
              name: UIApplication.willEnterForegroundNotification,
              object: nil
          )
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: .scrollToNextVideo, object: nil)
    }
    
    @objc func playMostVisibleCellVideo() {
        // Ensure there are visible cells
        guard let visibleCells = reelsCollectionView.visibleCells as? [ISMReelsCollectionViewCell] else { return }
        
        var mostVisibleCell: ISMReelsCollectionViewCell?
        var maxVisibleHeight: CGFloat = 0

        // Get the collection view's visible rectangle
        let visibleRect = CGRect(
            origin: reelsCollectionView.contentOffset,
            size: reelsCollectionView.bounds.size
        )

        for cell in visibleCells {
            // Calculate the intersection of the cell's frame with the visible rect
            let intersection = visibleRect.intersection(cell.frame)
            let visibleHeight = intersection.height

            // Track the cell with the maximum visible height
            if visibleHeight > maxVisibleHeight {
                maxVisibleHeight = visibleHeight
                mostVisibleCell = cell
            }
        }

        // Play the video in the most visible cell
        if let cellToPlay = mostVisibleCell, let player = cellToPlay.player {
            player.play()
        }
    }

}
