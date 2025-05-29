//
//  ReelsView+SideBar.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit

/// Responsible for addng components to the side bar of the Reels Cell
class ISMReelsSideBarSocialView : UIView{
    //vstack
    var buttonsStackView : UIStackView = UIStackView()
    //mute
    var muteButton = UIButton()
    //like + count
    var likesButton = UIButton()
    var likesCount = UIButton()
    //views + count
    var viewsButton = UIButton()
    var viewsCount = UIButton()
    //comment + count
    var commentsButton = UIButton()
    var commentsCount = UIButton()
    //share
    var shareButton = UIButton()
    //more
    var moreButton = UIButton()
    
    //MARK: -Declarations
    /// Holds which buttons are to be shown on the side bar of the Reels Cell
    var socialButtons : [IVSReelsSocialButtons] = [.mute , .like , .views , .comment , .share , .more]
    /// Width of the buttons of the social View in the Reels Cell
    let socialButtonsWidth = 30.0
    /// Label height that shows the count on the social View in the Reels Cell
    let labelHeight = 20.0
    var isLiked : Bool!
    var delegate : ISMReelsSideBarSocialDelegates?
    var data : ISMReels!
    
    /// Add a property to track pending requests
    var isPendingLikeRequest = false
    
    /// Add a property to store the original count when the view loads
    var originalLikesCount: Int = 0
    
    /// Store the original state when the view first loads
    var originalLikeState: Bool = false
  
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    
    func setupCell(data : ISMReels) {
        self.data = data
        originalLikesCount = data.likesCount // Remember original like count
        originalLikeState = isLiked ?? false  // Remember original like status
        likesCount.setTitle("\(data.likesCount)", for: .normal)
        commentsCount.setTitle("\(data.commentsCount)", for: .normal)
        viewsCount.setTitle("\(data.viewsCount)", for: .normal)
        isLiked = data.liked ?? false
        likesButton.setImage(isLiked ? UIImage(resource: .ivslike) : UIImage(resource: .unLike), for:  .normal)
        muteButton.setImage((IVSReelsUtility.isMute ? UIImage(resource: .ivsunmute) : UIImage(resource: .ivsmute)), for: .normal)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
