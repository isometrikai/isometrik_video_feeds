//
//  ISMReelsView+BlurView.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation
import UIKit

class ISMReelsBlurView : UIView {
    //top view
    var blurEffectView = UIImageView()
    var subscriptionStackView = UIStackView()
    var subscriptionLabel = UILabel()
    var subscriptionImageView = UIImageView()
    //Subscription
    var subscriptionButton = UIButton()
    var subscriptionAmountLabel = UILabel()
    var subscriptionAmountImage =  UIImageView()
    var subscriptionButtonAndImageView = UIView()
    //Unlock
    var unlockButton = UIButton()
    var unlockLabel = UILabel()
    var unlockImageView = UIImageView()
    var unlockButtonAndImageView = UIView()
 
    private var data : ISMReels!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setBlurViewCell(data : ISMReels) {
        self.data = data
        self.unlockLabel.text = "Unlock for \(data.postAmount)"
        
        if data.subscriptonAmount ?? 0 > 0 {
            self.subscriptionAmountLabel.text = "Subscribe for \(data.subscriptonAmount ?? 0)"
            self.subscriptionButtonAndImageView.isHidden = false
        }else {
            self.subscriptionAmountLabel.text = "0"
            self.subscriptionButtonAndImageView.isHidden = true
        }
    }
    
    
    func updateBlurViewEffect() {
        data.updateIsPurchased(isPurchased: true)
    }
    
    
    
    func configureUI(){
        setBlurEffect()
        setsubscriptionStackView()
        setUpConstraints()
    }
    
    func setBlurEffect(){
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.image = UIImage(resource: .iconBlur)
        blurEffectView.frame = self.bounds
        blurEffectView.isUserInteractionEnabled = true
        self.addSubview(blurEffectView)
    }
    func setSubscriptionLabel(){
        subscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionLabel.text = "Subscribe to see more videos"
        subscriptionLabel.textColor = .white
        subscriptionLabel.textAlignment = .center
        subscriptionLabel.font = .systemFont(ofSize: 14)
        subscriptionStackView.addArrangedSubview(subscriptionLabel)
    }
    
    func setSubscriptionImageView(){
        subscriptionImageView.defaultImageViewStyle()
        subscriptionImageView.image = UIImage(resource:.iconLock)
        subscriptionImageView.contentMode = .scaleAspectFit
        subscriptionStackView.addArrangedSubview(subscriptionImageView)
    }
    
    func setSubscriptionButton(){
        subscriptionButton.translatesAutoresizingMaskIntoConstraints = false
        subscriptionButton.setTitleColor(.white, for: .normal)
        subscriptionButton.titleLabel?.font = .systemFont(ofSize: 14)
        subscriptionButton.backgroundColor = .clear
        subscriptionLabel.clipsToBounds = true
        subscriptionButton.addTarget(self, action: #selector(subscriptionButtonTapped), for: .touchUpInside)
        subscriptionButtonAndImageView.addSubview(subscriptionButton)
    }
    
    func setUnlockButton(){
        unlockButton.translatesAutoresizingMaskIntoConstraints = false
        unlockButton.setTitleColor(.white, for: .normal)
        unlockButton.titleLabel?.font = .systemFont(ofSize: 14)
        unlockButton.backgroundColor = .clear
        unlockButton.clipsToBounds = true
        unlockButton.addTarget(self, action: #selector(unlockButtonTapped), for: .touchUpInside)
        unlockButtonAndImageView.addSubview(unlockButton)
    }
    
    func setUpSubscriptionButtonAndImageView() {
        setUpSubscriptionLabel()
        setUnlockSubscriptionImageView()
        setSubscriptionButton()
        subscriptionButtonAndImageView.translatesAutoresizingMaskIntoConstraints = false
        subscriptionButtonAndImageView.layer.cornerRadius = 25
        subscriptionButtonAndImageView.layer.borderWidth = 1
        subscriptionButtonAndImageView.layer.borderColor = UIColor(resource: .sOwhite).cgColor
        subscriptionButtonAndImageView.isHidden = true
        subscriptionStackView.addArrangedSubview(subscriptionButtonAndImageView)
    }
    
    func setUpUnlockButtonAndImageView() {
        setUpUnlockLabel()
        setUnlockImageView()
        setUnlockButton()
        unlockButtonAndImageView.translatesAutoresizingMaskIntoConstraints = false
        unlockButtonAndImageView.layer.cornerRadius = 25
        unlockButtonAndImageView.layer.borderWidth = 1
        unlockButtonAndImageView.layer.borderColor = UIColor(resource: .sOwhite).cgColor
        subscriptionStackView.addArrangedSubview(unlockButtonAndImageView)
        
    }
    
    
    func setUnlockSubscriptionImageView(){
        subscriptionAmountImage.translatesAutoresizingMaskIntoConstraints = false
        subscriptionAmountImage.image = UIImage(resource:.iconCoin)
        subscriptionAmountImage.contentMode = .scaleAspectFit
        subscriptionButtonAndImageView.addSubview(subscriptionAmountImage)
    }
    
    func setUnlockImageView(){
        unlockImageView.translatesAutoresizingMaskIntoConstraints = false
        unlockImageView.image = UIImage(resource:.iconCoin)
        unlockImageView.contentMode = .scaleAspectFit
        unlockButtonAndImageView.addSubview(unlockImageView)
    }
    
    func setUpSubscriptionLabel() {
        subscriptionAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionAmountLabel.text = "Subscribe for 50"
        subscriptionAmountLabel.textColor = .white
        subscriptionAmountLabel.textAlignment = .center
        subscriptionAmountLabel.font = .systemFont(ofSize: 14)
        subscriptionButtonAndImageView.addSubview(subscriptionAmountLabel)
    }
    
     func setUpUnlockLabel() {
         unlockLabel.translatesAutoresizingMaskIntoConstraints = false
         unlockLabel.text = "Unlock for 50"
         unlockLabel.textColor = .white
         unlockLabel.textAlignment = .center
         unlockLabel.font = .systemFont(ofSize: 14)
        unlockButtonAndImageView.addSubview(unlockLabel)
    }
    
    
    func setsubscriptionStackView(){
        setSubscriptionImageView()
        setSubscriptionLabel()
        //unlock view
        setUpUnlockButtonAndImageView()
        //subscription View
        setUpSubscriptionButtonAndImageView()
        
        
        subscriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        subscriptionStackView.axis = .vertical
        subscriptionStackView.distribution = .fill
        subscriptionStackView.spacing = 10
        blurEffectView.addSubview(subscriptionStackView)
    }

    func setUpConstraints(){
        NSLayoutConstraint.activate([
            //blur vIew
            blurEffectView.topAnchor.constraint(equalTo: self.topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //lock image
            subscriptionImageView.heightAnchor.constraint(equalToConstant: 60),
            subscriptionImageView.widthAnchor.constraint(equalToConstant: 60),
            //header label
            subscriptionLabel.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            //stack View
            subscriptionStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subscriptionStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //subscription view
            subscriptionButtonAndImageView.heightAnchor.constraint(equalToConstant: 45),

            subscriptionAmountLabel.centerXAnchor.constraint(equalTo: subscriptionButtonAndImageView.centerXAnchor),
            subscriptionAmountLabel.centerYAnchor.constraint(equalTo: subscriptionButtonAndImageView.centerYAnchor),
            
            subscriptionAmountImage.leadingAnchor.constraint(equalTo: subscriptionAmountLabel.trailingAnchor , constant: 5),
            subscriptionAmountImage.centerYAnchor.constraint(equalTo: subscriptionAmountLabel.centerYAnchor),
            subscriptionAmountImage.widthAnchor.constraint(equalToConstant: 20),
            subscriptionAmountImage.heightAnchor.constraint(equalToConstant: 20),
            
            subscriptionButton.leadingAnchor.constraint(equalTo: subscriptionButtonAndImageView.leadingAnchor),
            subscriptionButton.topAnchor.constraint(equalTo: subscriptionButtonAndImageView.topAnchor),
            subscriptionButton.bottomAnchor.constraint(equalTo: subscriptionButtonAndImageView.bottomAnchor),
            subscriptionButton.trailingAnchor.constraint(equalTo: subscriptionButtonAndImageView.trailingAnchor),
            
            //unlock view
            unlockButtonAndImageView.heightAnchor.constraint(equalToConstant: 45),
            
            unlockLabel.centerXAnchor.constraint(equalTo: unlockButtonAndImageView.centerXAnchor),
            unlockLabel.centerYAnchor.constraint(equalTo: unlockButtonAndImageView.centerYAnchor),
            
            unlockImageView.leadingAnchor.constraint(equalTo: unlockLabel.trailingAnchor , constant: 5),
            unlockImageView.centerYAnchor.constraint(equalTo: unlockLabel.centerYAnchor),
            unlockImageView.widthAnchor.constraint(equalToConstant: 20),
            unlockImageView.heightAnchor.constraint(equalToConstant: 20),
            
            unlockButton.leadingAnchor.constraint(equalTo: unlockButtonAndImageView.leadingAnchor),
            unlockButton.topAnchor.constraint(equalTo: unlockButtonAndImageView.topAnchor),
            unlockButton.bottomAnchor.constraint(equalTo: unlockButtonAndImageView.bottomAnchor),
            unlockButton.trailingAnchor.constraint(equalTo: unlockButtonAndImageView.trailingAnchor),
            
        ])
        
    }
    
    @objc func subscriptionButtonTapped(){
        print("Subscription Button Tapped")
        if !IVSKit.getIsGuestUser() {
            IVSReelsUtility.postSubscribePost(data:
                    .init(postID: data.postId, userId: data.userId, imageUrl: data.imageUrl, thumbnailUrl: data.imageUrl, isBookmarked: data.isBookMarked, username: data.name, viewsCount: data.viewsCount, mediaType: data.mediaType, captions: data.caption, imageUrlWidth: data.imageUrlWidth, allowDownload: data.allowDownload, profilePic: data.profilePic, ispurchased: data.isPurchased, musicId: data.musicData?._id , postAmount : data.postAmount , susbcriptionAmount : data.subscriptonAmount))
        }else{
            IVSReelsUtility.postOpenLoginScreen()
        }
        
    }
    @objc func unlockButtonTapped(){
        print("Unlock Button Tapped")
        if !IVSKit.getIsGuestUser() {
            IVSReelsUtility.postOpenLockedPost(data:
                    .init(postID: data.postId, userId: data.userId, imageUrl: data.imageUrl, thumbnailUrl: data.imageUrl, isBookmarked: data.isBookMarked, username: data.name, viewsCount: data.viewsCount, mediaType: data.mediaType, captions: data.caption, imageUrlWidth: data.imageUrlWidth, allowDownload: data.allowDownload, profilePic: data.profilePic, ispurchased: data.isPurchased, musicId: data.musicData?._id , postAmount : data.postAmount , susbcriptionAmount : data.subscriptonAmount))
        }else{
            IVSReelsUtility.postOpenLoginScreen()
        }
    }
}
