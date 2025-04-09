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
    var postLikeView = IVSPostLikeView()
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var data : ISMReels?
    var delegates : ISMReelsDelegates?
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
        playerLayer?.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: self.contentView.bounds.height)
    }
    
    deinit {
        print("SOReelsCollectionViewCell deinitialised")
    }
    
   //MARK: - Setting up Cell
    func setUpCell(data : ISMReels){
        self.data = data
        setCellForBottomView(data: data)
        setCellForSocialView(data: data)
        configureMedia(url: data.imageUrl, mediaType: data.mediaType)
        configureViews(data: data)
//        setCellForBlurView(data : data)
       
    }
    
    func setCellForSocialView(data : ISMReels){
        socialView.setupCell(data: data)
    }
    
    func setCellForBottomView(data : ISMReels){
        bottomView.setUpBottomViewCell(data: data)
    }
    
    func configureViews(data : ISMReels) {
        //set up the remaining UI over the image or video
        configurePostLikeView()
        configurePlayPauseView()
        setCellForBlurView(data : data)
        configureSocialView()
        configureBottomView()
        configureConstraints()
    }
    
    func setCellForBlurView(data : ISMReels) {
        
        if data.userId == IVSKit.getUserId() || data.isPurchased || data.postAmount == 0 {
            blurView.removeFromSuperview() // Ensure it’s not lingering
        }else{
            configureBlurView()
            addBlurViewConstraints()
            blurView.setBlurViewCell(data: data)
            blurView.isHidden = false
            
         }
    }
    
    
    
}

