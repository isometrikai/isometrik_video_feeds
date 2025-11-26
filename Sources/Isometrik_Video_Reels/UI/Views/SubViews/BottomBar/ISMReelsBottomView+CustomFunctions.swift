//
//  ISMReelsBottomView+CustomFunctions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit
import SwiftUI

extension ISMReelsBottomView {
    func updateProgress(_ progress: Float) {
        progressBar.progress = progress
    }
}

extension ISMReelsBottomView {
    //MARK: - Custom Functions
    
    /// Configures the components of the view
    func setUpUI(){
        setUpBackgrounView()
        setUpConstraints()
    }
    /// Sets the styling of the container Stack View
    func setUpBackgrounView(){
        setUpDescriptionStackView()
        setUpControlStackView()
        captionView()
        configureCategoryButton()
        configureMusicView()
        configureSendTipConatinerView()
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.axis = .vertical
        backgroundStackView.spacing = 5
        backgroundStackView.distribution = .fill
        backgroundStackView.alignment = .fill
        self.addSubview(backgroundStackView)
        
    }
    
    func configureSendTipConatinerView() {
        sendTipButtonContainerView = UIView()
        configureSendtipButton()
        sendTipButtonContainerView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.addArrangedSubview(sendTipButtonContainerView)
    }
    
    func configureSendtipButton() {
        sendTipButton = UIButton()
        sendTipButton.translatesAutoresizingMaskIntoConstraints = false
        sendTipButton.setTitle("Send Tip", for: .normal)
        sendTipButton.setTitleColor(UIColor(resource: .sOwhite), for: .normal)
        sendTipButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        sendTipButton.layer.cornerRadius = 8
        sendTipButton.layer.masksToBounds = true
        sendTipButton.layer.borderColor = UIColor(resource: .sOwhite).cgColor
        sendTipButton.layer.borderWidth = 1.0
        sendTipButton.backgroundColor = .clear
        sendTipButton.addTarget(self, action: #selector(sendTipTapped), for: .touchUpInside)
        sendTipButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 25, bottom: 5, right: 25)
        sendTipButtonContainerView.addSubview(sendTipButton)
    }
    
    @objc func sendTipTapped() {
        print("sendTip Tapped")
        IVSReelsUtility.postOpenTipViewController(postID: data.postId ?? "", postUserName: data.name, postUserID: data.userId,isPurchased: data.isPurchased , isPaid: data.isPaid)
        
    }
    
    
    ///Responsible for setting the styling of name and star indicator
    func setUpInfoView(){
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.axis = .horizontal
        infoContainerView.spacing = 5
        infoContainerView.distribution = .fill
        infoContainerView.alignment = .center
        setUpNameView()
        setUpStarStatusView()
        nameAndDateStackView.addArrangedSubview(infoContainerView)
       
    }
    /// Sets the styling of Information stack view
    func setUpDescriptionStackView(){
        setUpProfileButton()
        configureNameAndDateStackView()
        setUpFollowButton()
        addDummyView()
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.axis = .horizontal
        descriptionStackView.spacing = 10
        descriptionStackView.distribution = .fill
        descriptionStackView.alignment = .center
        backgroundStackView.addArrangedSubview(descriptionStackView)
    }
    
    func configureDateLabelAndPlaceLabel() {
        let hstack = UIStackView()
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.axis = .horizontal
        hstack.alignment = .fill
        hstack.distribution = .fillProportionally
        hstack.spacing = 8
        
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "9 months ago"
        dateLabel.font = .systemFont(ofSize: 12 , weight: .regular)
        dateLabel.textColor = UIColor(resource: .sOwhite)

        placeButton = UIButton()
        placeButton.translatesAutoresizingMaskIntoConstraints = false
        placeButton.setTitle("place", for: .normal)
        placeButton.setTitleColor(UIColor(resource: .sOwhite), for: .normal)
        placeButton.titleLabel?.font = .systemFont(ofSize: 12 , weight: .regular)
        placeButton.titleLabel?.textColor = UIColor(resource: .sOwhite)
        placeButton.addTarget(self, action: #selector(placeTapped), for: .touchUpInside)
        hstack.addArrangedSubview(placeButton)
        hstack.addArrangedSubview(dateLabel)
        
        nameAndDateStackView.addArrangedSubview(hstack)
        
    }
    
    func configureCategoryButton() {
        categoryButton = UIButton()
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.setTitle("Category", for: .normal)
        categoryButton.setTitleColor(UIColor(resource: .sOwhite), for: .normal)
        categoryButton.titleLabel?.font = .systemFont(ofSize: 12 , weight: .regular)
        categoryButton.titleLabel?.textColor = UIColor(resource: .sOwhite)
        categoryButton.contentHorizontalAlignment = .left
        categoryButton.addTarget(self, action: #selector(categoryTapped), for: .touchUpInside)
        backgroundStackView.addArrangedSubview(categoryButton)
        
        NSLayoutConstraint.activate([
            categoryButton.widthAnchor.constraint(equalTo: backgroundStackView.widthAnchor, multiplier: 0.3),
        ])
    }
    
    
    func configureNameAndDateStackView() {
        nameAndDateStackView = UIStackView()
        setUpInfoView()
        configureDateLabelAndPlaceLabel()
        nameAndDateStackView.translatesAutoresizingMaskIntoConstraints = false
        nameAndDateStackView.alignment = .leading
        nameAndDateStackView.axis = .vertical
        nameAndDateStackView.distribution = .fillProportionally
        nameAndDateStackView.spacing = 0
        descriptionStackView.addArrangedSubview(nameAndDateStackView)
       
    }
    
    func setUpControlStackView(){
        configureRewindButton()
        configureProgressBar()
        configureForwardButton()
        controlStackView.translatesAutoresizingMaskIntoConstraints = false
        controlStackView.axis = .horizontal
        controlStackView.spacing = 5
        controlStackView.distribution = .fill
        controlStackView.alignment = .center
        controlStackView.isHidden = true
        backgroundStackView.addArrangedSubview(controlStackView)
    }
    
    func configureForwardButton(){
        fastForwardButton.translatesAutoresizingMaskIntoConstraints = false
        fastForwardButton.setImage(UIImage(resource: .forward), for: .normal)
        fastForwardButton.addTarget(self, action: #selector(fastForwardTapped), for: .touchUpInside)
        controlStackView.addArrangedSubview(fastForwardButton)
    }
    
    func configureRewindButton(){
        rewindButton.translatesAutoresizingMaskIntoConstraints = false
        rewindButton.setImage(UIImage(resource: .rewind), for: .normal)
        rewindButton.addTarget(self, action: #selector(rewindTapped), for: .touchUpInside)
        controlStackView.addArrangedSubview(rewindButton)
    }
    
    func configureMusicLabel() {
        let labelContainerView = UIView()
        labelContainerView.translatesAutoresizingMaskIntoConstraints = false
        labelContainerView.backgroundColor = .clear // Keeps background transparent
        
        musicIcon.translatesAutoresizingMaskIntoConstraints = false
        musicIcon.image = UIImage(resource: .ivsMusic)
        musicIcon.contentMode = .scaleAspectFit
        
        
        musicLabel = UILabel()
        musicLabel.translatesAutoresizingMaskIntoConstraints = false
        musicLabel.text = "Originally by The Weeknd"
        musicLabel.textColor = .white
        musicLabel.font = .systemFont(ofSize: 13, weight: .medium)
        musicLabel.backgroundColor = .clear //UIColor(resource: .sOblack).withAlphaComponent(0.3)
        musicLabel.layer.cornerRadius = 10
        musicLabel.clipsToBounds = true
        
        labelContainerView.addSubview(musicIcon)
        labelContainerView.addSubview(musicLabel)
        musicView.addArrangedSubview(labelContainerView)

        // Constraints for musicLabel inside labelContainerView
        NSLayoutConstraint.activate([
            musicIcon.centerYAnchor.constraint(equalTo: musicLabel.centerYAnchor),
            musicIcon.widthAnchor.constraint(equalToConstant: 18),
            musicIcon.leadingAnchor.constraint(equalTo: labelContainerView.leadingAnchor, constant: 2),
            
            musicLabel.leadingAnchor.constraint(equalTo: musicIcon.trailingAnchor, constant: 2),
            musicLabel.trailingAnchor.constraint(greaterThanOrEqualTo: labelContainerView.trailingAnchor),
            musicLabel.centerYAnchor.constraint(equalTo: labelContainerView.centerYAnchor)
        ])
    }

    
    func configureMusicButton() {
        musicRotatingButton = UIButton()
        musicRotatingButton.translatesAutoresizingMaskIntoConstraints = false
        musicRotatingButton.setImage(UIImage(resource: .dummyBackView), for: .normal)
        musicRotatingButton.layer.cornerRadius = 15
        musicRotatingButton.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        musicRotatingButton.clipsToBounds = true
        musicView.addArrangedSubview(musicRotatingButton)
    }
   
    
    func startRotatingMusicButton() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat.pi * 2
        rotationAnimation.duration = 2// Adjust speed (in seconds)
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.isRemovedOnCompletion = false

        musicRotatingButton.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    
    func configureMusicView() {
        musicView = UIStackView()
        configureMusicLabel()
        configureMusicButton()
        musicView.translatesAutoresizingMaskIntoConstraints = false
        musicView.axis = .horizontal
        musicView.spacing = 5
        musicView.distribution = .equalSpacing
        musicView.alignment = .fill
       
        backgroundStackView.addArrangedSubview(musicView)
        
    }
    
    
    /// Styles the progress bar
    func configureProgressBar(){
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progressTintColor = IVSKit.shared.getThemeColor()
        progressBar.trackTintColor = .lightGray
        controlStackView.addArrangedSubview(progressBar)
    }
    /// Sets the styling of the profile Button
    func setUpProfileButton(){
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setImage(UIImage(resource: .iconProfile), for: .normal)
        profileButton.layer.cornerRadius = 25
        profileButton.clipsToBounds = true
        profileButton.backgroundColor = IVSKit.shared.getThemeColor()
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        descriptionStackView.addArrangedSubview(profileButton)
    }
    /// Sets the styling of the name Label
    func setUpNameView(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.setTitle("Name Button", for: .normal)
        nameLabel.titleLabel?.font = UIFont.systemFont(ofSize: 18 , weight: .semibold)
        nameLabel.setTitleColor(UIColor(resource: .sOwhite), for: .normal)
        nameLabel.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        infoContainerView.addArrangedSubview(nameLabel)
    }
    /// Sets the styling of the star indicator View
    func setUpStarStatusView(){
        starIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        starIndicatorImageView.image = UIImage(resource: .iconStar)
        starIndicatorImageView.contentMode = .scaleAspectFit
        starIndicatorImageView.isHidden = true
        infoContainerView.addArrangedSubview(starIndicatorImageView)
    }
    /// Sets the styling of the follow button
    func setUpFollowButton(){
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.setTitle("Follow", for: .normal)
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        followButton.backgroundColor = IVSKit.shared.getThemeColor()
        followButton.layer.cornerRadius = 13
        followButton.titleLabel?.textColor = .white
        followButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        followButton.addTarget(self, action: #selector(followTapped), for: .touchUpInside)
        infoContainerView.addArrangedSubview(followButton)
    }
    /// Sets the styling of the caption View
    func captionView(){
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.text = "Captions are to be kept here "
        captionLabel.textColor = .white
        captionLabel.font = UIFont.systemFont(ofSize: 17)
        captionLabel.isEditable = false
        captionLabel.isSelectable = true
        captionLabel.isScrollEnabled = false
        captionLabel.dataDetectorTypes = [.all]
        captionLabel.backgroundColor = .clear
        captionLabel.textContainerInset = .zero
        captionLabel.textContainer.lineFragmentPadding = 0
        
        backgroundStackView.addArrangedSubview(captionLabel)
    }
    
    func addDummyView(){
        dummyView.backgroundColor = .red
        descriptionStackView.addArrangedSubview(dummyView)
    }
    /// Sets the Constraints of the Bottom View
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            // Background Stack View Constraints
            backgroundStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            backgroundStackView.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 10),
            // Description Stack View Constraints
            descriptionStackView.leadingAnchor.constraint(equalTo: backgroundStackView.leadingAnchor),
//            descriptionStackView.trailingAnchor.constraint(equalTo: backgroundStackView.trailingAnchor),
            descriptionStackView.topAnchor.constraint(equalTo: backgroundStackView.topAnchor),
            // Profile Button Constraints
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.widthAnchor.constraint(equalToConstant: 50),
            rewindButton.heightAnchor.constraint(equalToConstant: 30),
            rewindButton.widthAnchor.constraint(equalToConstant: 30),
            fastForwardButton.heightAnchor.constraint(equalToConstant: 30),
            fastForwardButton.widthAnchor.constraint(equalToConstant: 30),
            // Star Indicator Constraints
            starIndicatorImageView.heightAnchor.constraint(equalToConstant: 20),
            starIndicatorImageView.widthAnchor.constraint(equalToConstant: 20),
            starIndicatorImageView.centerYAnchor.constraint(equalTo: infoContainerView.centerYAnchor),
            starIndicatorImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor,constant: 5),
            // Name Label
            nameLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor),
            dateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            //Music Rotating View
            musicRotatingButton.heightAnchor.constraint(equalToConstant: 35),
            musicRotatingButton.widthAnchor.constraint(equalToConstant: 35),
            //music label
            musicLabel.heightAnchor.constraint(equalToConstant: 30),
            //send Tip button
            sendTipButtonContainerView.heightAnchor.constraint(equalToConstant: 30),
            sendTipButton.heightAnchor.constraint(equalToConstant: 30),
            sendTipButton.centerYAnchor.constraint(equalTo: sendTipButtonContainerView.centerYAnchor),
            sendTipButton.leadingAnchor.constraint(equalTo: sendTipButtonContainerView.leadingAnchor),
            
        ])
    }
}

struct ISMReelsBottomView_Preview : PreviewProvider{
    static var previews: some View {
        IVSPreviewViews {
            ISMReelsBottomView()
        }
    }
}
