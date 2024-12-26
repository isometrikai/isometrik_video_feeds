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
    var likesCount = UILabel()
    //views + count
    var viewsButton = UIButton()
    var viewsCount = UILabel()
    //comment + count
    var commentsButton = UIButton()
    var commentsCount = UILabel()
    //share
    var shareButton = UIButton()
    //more
    var moreButton = UIButton()
    
    //MARK: -Declarations
    /// Holds which buttons are to be shown on the side bar of the Reels Cell
    var socialButtons : [ISMReelsSocialButtons] = [.mute , .like , .views , .comment , .share , .more]
    /// Width of the buttons of the social View in the Reels Cell
    let socialButtonsWidth = 30.0
    /// Label height that shows the count on the social View in the Reels Cell
    let labelHeight = 20.0
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
