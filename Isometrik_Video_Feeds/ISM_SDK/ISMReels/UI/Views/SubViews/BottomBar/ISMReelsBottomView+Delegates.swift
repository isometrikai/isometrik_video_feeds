//
//  ISMReelsBottomView+Delegates.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation

protocol ISMReelsBottomViewDelegate: AnyObject {
    func didTapProfileButton()
    func didTapFollowButton(isFollowed : Bool)
    func fastForwardVideo()
    func rewindVideo()
}
