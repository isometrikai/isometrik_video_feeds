//
//  PlayPauseView.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

class ISMReelsPlayPauseView : UIView {
    var playPauseButton = UIButton()
    var playPauseImageView = UIImageView()
    var isPlaying = true
    var delegate : ISMReelsViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
