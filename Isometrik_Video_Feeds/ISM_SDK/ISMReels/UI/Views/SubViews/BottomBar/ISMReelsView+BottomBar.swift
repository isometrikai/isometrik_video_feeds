//
//  ISMReelsBottomView+BottomBar.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit

/// Responsible for adding configurations / elements and components related to description View present at the bottom of the ISMReels Cell
class ISMReelsBottomView : UIView{
    /// Container Verticle Stack View
    let backgroundStackView = UIStackView()
    ///  Contains information about the user who has posted the reels
    let descriptionStackView = UIStackView()
    //profile
    /// Profile of the user who has posted the reel
    let profileButton = UIButton()
    /// Name of the user who has posted the reel
    var nameLabel = UILabel()
    /// Indicator to show if the user is a star user or not
    let starIndicatorImageView = UIImageView()
    /// Follow button to follow a user who has posted a post
    let followButton = UIButton()
    ///View that holds name and star indicator
    let infoContainerView = UIView()
    //Caption
    /// Caption of the post posted bu the user on his/her post
    let captionLabel = UILabel()
    
    var delegate : ISMReelsBottomViewDelegate?
    var isFollowed: Bool = false {
        didSet {
            followButton.setTitle(isFollowed ? "Following" : "Follow", for: .normal)
        }
    }
    //MARK: - Initialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

