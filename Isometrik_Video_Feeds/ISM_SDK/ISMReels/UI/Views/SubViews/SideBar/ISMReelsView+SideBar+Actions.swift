//
//  ISMReelsView+SideBar+Actions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

extension ISMReelsSideBarSocialView{
    //MARK: - Button Actions
    
    ///  Action performed when mute button is tapped
    @objc func muteTapped(){
        print("mute Tapped")
        isMute.toggle()
        muteButton.setImage((isMute ? .unmute : .mute), for: .normal)
        delegate?.muteTapped(isMute: isMute)
    }
    /// Action performed when like Button is tapped
    @objc func likeTapped(){
        print("like Tapped")
        isLiked.toggle()
        likesButton.setImage(isLiked ? .like : .unLike, for:  .normal)
        delegate?.likeTapped(islike: isLiked)
    }
    /// Action performed when liews Button is tapped
    @objc func viewsTapped(){
        print("Views Tapped")
    }
    /// Action performed when comments Button is tapped
    @objc func commentsTapped(){
        print("Comments Tapped")
    }
    /// Action performed when share Button is tapped
    @objc func shareTapped(){
        print("Share Tapped")
    }
    /// Action performed when More Button is tapped
    @objc func moreTapped(){
        print("More Tapped")
    }
}
