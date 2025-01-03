//
//  ISMReelsBottomView+Actions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

extension ISMReelsBottomView{
    //MARK: - Button Actions
    
    /// Opens user's profile ,who has posted the reel
    @objc func profileTapped(){
        print("profile Tapped")
        delegate?.didTapProfileButton()
    }
    /// Follows a user who has posted a ree;
    @objc func followTapped(){
        print("follow Tapped")
        isFollowed.toggle()
        delegate?.didTapFollowButton(isFollowed: isFollowed)
    }
    @objc func fastForwardTapped(){
        print("Fast Forward Tapped")
        delegate?.fastForwardVideo()
    }
    @objc func rewindTapped(){
        print("Rewind Tapped")
        delegate?.rewindVideo()
    }
}
