//
//  CollectionViewCell.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import UIKit
import AVFoundation

typealias ISMReelsDelegates = ISMReelsViewDelegate & ISMReelsBottomViewDelegate & ISMReelsSideBarSocialDelegates

class ISMReelsCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    
    /// container view of the reels cell
    var reelsBackgroundView: UIView!
    /// imageView of the reels cell
    var reelsImageView: UIImageView!
    
    //MARK: - Declarations
    
    /// side bar social buttons of the reels cell
    var socialView = ISMReelsSideBarSocialView()
    /// description view at the bottom of the reels cell
    var bottomView = ISMReelsBottomView()
    /// Manages the playing and pausing of Reels
    var playPauseView = ISMReelsPlayPauseView()
    var blurView = ISMReelsBlurView()
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    //MARK: - Initialisers and Deinitialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = CGRect(x: 0, y: 10, width: self.contentView.bounds.width, height: self.contentView.bounds.height)
    }
    
    deinit {
        print("SOReelsCollectionViewCell deinitialised")
    }
    
   //MARK: - Setting up Cell
    func setUpCell(data : ISMReels){
        bottomView.nameLabel.text = data.name
        configureMedia(url: data.ImageUrl, mediaType: data.mediaType)
        //set up the remaining UI over the image or video
        configureSocialView()
        configureBottomView()
        configurePlayPauseView()
        configureConstraints()
        if data.isPaid {
            configureBlurView()
            addBlurViewConstraints()
            blurView.isHidden = false
        } else {
            blurView.removeFromSuperview() // Ensure it’s not lingering
        }
        
        
        
    }
}

