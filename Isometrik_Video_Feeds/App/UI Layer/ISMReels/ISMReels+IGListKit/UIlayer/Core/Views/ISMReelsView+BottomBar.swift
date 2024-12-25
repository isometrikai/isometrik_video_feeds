//
//  ReelsView+BottomBar.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit

class ReelsBottomView : UIView{
    let backgroundStackView = UIStackView()
    let descriptionStackView = UIStackView()
    //profile
    let profileButton = UIButton()
    var nameLabel = UILabel()
    let starIndicatorImageView = UIImageView()
    let followButton = UIButton()
    //Caption
    let captionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func setUpUI(){
        setUpBackgrounView()
        setUpDescriptionStackView()
        setUpProfileButton()
        setUpNameView()
        setUpStarStatusView()
        setUpFollowButton()
        captionView()
    }
    
    func setUpBackgrounView(){
        backgroundStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundStackView.axis = .vertical
        backgroundStackView.spacing = 10
        backgroundStackView.distribution = .fill
        backgroundStackView.alignment = .fill
        self.addSubview(backgroundStackView)
       
    }
    
    func setUpDescriptionStackView(){
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.axis = .horizontal
        descriptionStackView.spacing = 5
        descriptionStackView.distribution = .fill
        descriptionStackView.alignment = .center
        backgroundStackView.addArrangedSubview(descriptionStackView)
    
    }
    
    func setUpProfileButton(){
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setImage(UIImage(resource: .reels), for: .normal)
        profileButton.layer.cornerRadius = 25
        profileButton.backgroundColor = .soAppBase
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        descriptionStackView.addArrangedSubview(profileButton)
    }
    
    func setUpNameView(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Navpreet Kaur"
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = .white
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        descriptionStackView.addArrangedSubview(nameLabel)
    }
    
    func setUpStarStatusView(){
        starIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        starIndicatorImageView.image = UIImage(resource: .like)
        starIndicatorImageView.contentMode = .scaleAspectFit
        descriptionStackView.addArrangedSubview(starIndicatorImageView)
    }
    
    func setUpFollowButton(){
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.setTitle("Follow", for: .normal)
        followButton.backgroundColor = .soAppBase
        followButton.layer.cornerRadius = 10
        followButton.titleLabel?.textColor = .white
        followButton.addTarget(self, action: #selector(followTapped), for: .touchUpInside)
        descriptionStackView.addArrangedSubview(followButton)
    }
    
    func captionView(){
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.text = "Captions are to be kept here "
        captionLabel.textColor = .white
        captionLabel.font = UIFont.systemFont(ofSize: 17)
        backgroundStackView.addArrangedSubview(captionLabel)
    }
    
    @objc func profileTapped(){
        print("profile Tapped")
    }
    
    @objc func followTapped(){
        print("follow Tapped")
    }
    
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

            // Follow Button Constraints
            followButton.heightAnchor.constraint(equalToConstant: 30),
            followButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }

    
    
}
