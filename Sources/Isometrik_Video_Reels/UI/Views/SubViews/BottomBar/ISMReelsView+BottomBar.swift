//
//  ISMReelsBottomView+BottomBar.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit
import SwiftUI
/// Responsible for adding configurations / elements and components related to description View present at the bottom of the ISMReels Cell
class ISMReelsBottomView : UIView{
    /// Container Verticle Stack View
    let backgroundStackView = UIStackView()
    var dummyView = UIView()
    ///  Contains information about the user who has posted the reels
    let descriptionStackView = UIStackView()
    //profile
    /// Profile of the user who has posted the reel
    let profileButton = UIButton()
    /// Name of the user who has posted the reel
    var nameLabel = UIButton()
    var nameAndDateStackView : UIStackView!
    var dateLabel : UILabel!
    var musicView : UIStackView!
    var musicLabel : UILabel!
    var musicIcon = UIImageView()
    var musicRotatingButton : UIButton!
    var sendTipButtonContainerView : UIView!
    var sendTipButton : UIButton!
    /// Indicator to show if the user is a star user or not
    let starIndicatorImageView = UIImageView()
    /// Follow button to follow a user who has posted a post
    let followButton = UIButton()
    ///View that holds name and star indicator
    let infoContainerView = UIStackView()
    ///Control Stack
    let controlStackView = UIStackView()
    ///Forward Button
    let fastForwardButton = UIButton()
    /// Rewind Button
    let rewindButton = UIButton()
    /// progress bar
    let progressBar = UIProgressView(progressViewStyle: .default)
    //Caption
    /// Caption of the post posted bu the user on his/her post
    let captionLabel = UILabel()
    
    var data : ISMReels!
    var delegate : ISMReelsDelegates?
    var isFollowed: Bool = false {
        didSet {
            data.setFollowStatus(isfollow: isFollowed)
            followButton.setTitle(isFollowed ? "Following" : "Follow", for: .normal)
        }
    }
    //MARK: - Initialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    
    }
    
    func setUpBottomViewCell(data : ISMReels) {
        self.data = data
        self.nameLabel.setTitle("@\(data.name)", for: .normal) 
        self.dateLabel.text = IVSReelsUtility.timeAgo(from: data.date)
        self.isFollowed = data.isfollow
        self.captionLabel.text = data.caption
        let mediaUrl = data.profilePic //.replacingOccurrences(of: "http", with: "https")
        if let mediaUrl = mediaUrl , !mediaUrl.isEmpty {
            IVSReelsUtility.setImageFromUrlForButton(mediaUrl: mediaUrl, button: profileButton, placeholder: UIImage(resource: .iconProfile))
        }else {
            profileButton.setImage(IVSReelsUtility.createInitialsImage(from: data.name), for: .normal)
        }
       
        startRotatingMusicButton()
        
        if let musicData = data.musicData , musicData.songBackground != nil && musicData.name != nil{
            musicView.isHidden = false
            self.musicLabel.text = musicData.name
            IVSReelsUtility.setImageFromUrlForButton(mediaUrl: musicData.songBackground ?? "", button: self.musicRotatingButton, placeholder: UIImage(resource: .dummyBackView))
        }else{
            musicView.isHidden = true
        }
      
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//struct ISMReelsView_Preview : PreviewProvider{
//    static var previews: some View {
//        IVSPreviewViews {
//            ISMReelsBottomView()
//        }
//    }
//}
