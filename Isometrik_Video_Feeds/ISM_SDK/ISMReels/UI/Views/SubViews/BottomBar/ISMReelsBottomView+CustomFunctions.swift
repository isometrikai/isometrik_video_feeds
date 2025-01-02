//
//  ISMReelsBottomView+CustomFunctions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

extension ISMReelsBottomView {
    //MARK: - Custom Functions
    
    /// Configures the components of the view
    func setUpUI(){
        setUpBackgrounView()
        setUpDescriptionStackView()
        setUpProfileButton()
        setUpInfoView()
        setUpFollowButton()
        captionView()
    }
    /// Sets the styling of the container Stack View
    func setUpBackgrounView(){
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.axis = .vertical
        backgroundStackView.spacing = 10
        backgroundStackView.distribution = .fill
        backgroundStackView.alignment = .fill
        self.addSubview(backgroundStackView)
        
    }
    ///Responsible for setting the styling of name and star indicator
    func setUpInfoView(){
        infoContainerView.defaultViewStyle()
        descriptionStackView.addArrangedSubview(infoContainerView)
        setUpNameView()
        setUpStarStatusView()
    }
    /// Sets the styling of Information stack view
    func setUpDescriptionStackView(){
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.axis = .horizontal
        descriptionStackView.spacing = 5
        descriptionStackView.distribution = .fill
        descriptionStackView.alignment = .center
        backgroundStackView.addArrangedSubview(descriptionStackView)
        
    }
    /// Sets the styling of the profile Button
    func setUpProfileButton(){
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setImage(UIImage(resource: .iconProfile), for: .normal)
        profileButton.layer.cornerRadius = 25
        profileButton.backgroundColor = .soAppBase
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        descriptionStackView.addArrangedSubview(profileButton)
    }
    /// Sets the styling of the name Label
    func setUpNameView(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Navpreet Kaur"
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = .white
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        infoContainerView.addSubview(nameLabel)
    }
    /// Sets the styling of the star indicator View
    func setUpStarStatusView(){
        starIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        starIndicatorImageView.image = UIImage(resource: .iconStar)
        starIndicatorImageView.contentMode = .scaleAspectFit
        infoContainerView.addSubview(starIndicatorImageView)
    }
    /// Sets the styling of the follow button
    func setUpFollowButton(){
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.setTitle("Follow", for: .normal)
        followButton.backgroundColor = .soAppBase
        followButton.layer.cornerRadius = 10
        followButton.titleLabel?.textColor = .white
        followButton.addTarget(self, action: #selector(followTapped), for: .touchUpInside)
        descriptionStackView.addArrangedSubview(followButton)
    }
    /// Sets the styling of the caption View
    func captionView(){
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.text = "Captions are to be kept here "
        captionLabel.textColor = .white
        captionLabel.font = UIFont.systemFont(ofSize: 17)
        backgroundStackView.addArrangedSubview(captionLabel)
    }
    /// Sets the Constraints of the Bottom View
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            // Background Stack View Constraints
            backgroundStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            backgroundStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            // Description Stack View Constraints
            descriptionStackView.leadingAnchor.constraint(equalTo: backgroundStackView.leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: backgroundStackView.trailingAnchor),
            descriptionStackView.topAnchor.constraint(equalTo: backgroundStackView.topAnchor),
            // Profile Button Constraints
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.widthAnchor.constraint(equalToConstant: 50),
            // Star Indicator Constraints
            starIndicatorImageView.heightAnchor.constraint(equalToConstant: 20),
            starIndicatorImageView.widthAnchor.constraint(equalToConstant: 20),
            starIndicatorImageView.centerYAnchor.constraint(equalTo: infoContainerView.centerYAnchor),
            starIndicatorImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor,constant: 5),
            // Name Label
            nameLabel.centerYAnchor.constraint(equalTo: infoContainerView.centerYAnchor),
            // Follow Button Constraints
            followButton.heightAnchor.constraint(equalToConstant: 30),
            followButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}
