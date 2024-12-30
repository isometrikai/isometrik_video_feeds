//
//  ISMReelsView+BlurView.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation
import UIKit

class ISMReelsBlurView : UIView {
    var blurEffectView = UIImageView()
    var subscriptionStackView = UIStackView()
    var subscriptionLabel = UILabel()
    var subscriptionImageView = UIImageView()
    var subscriptionButton = UIButton()
    
    var delegate : SubscriptionViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI(){
        setBlurEffect()
        setsubscriptionStackView()
        setUpConstraints()
    }
    
    func setBlurEffect(){
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.image = .iconBlur
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
        subscriptionImageView.image = .iconCoin
        subscriptionStackView.addArrangedSubview(subscriptionImageView)
    }
    
    func setSubscriptionButton(){
        subscriptionButton.translatesAutoresizingMaskIntoConstraints = false
        subscriptionButton.setTitle("Subscribe", for: .normal)
        subscriptionButton.setTitleColor(.white, for: .normal)
        subscriptionButton.titleLabel?.font = .systemFont(ofSize: 14)
        subscriptionButton.backgroundColor = .black
        subscriptionButton.addTarget(self, action: #selector(subscriptionButtonTapped), for: .touchUpInside)
        subscriptionStackView.addArrangedSubview(subscriptionButton)
    }
    
    func setsubscriptionStackView(){
        setSubscriptionImageView()
        setSubscriptionLabel()
        setSubscriptionButton()
        subscriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        subscriptionStackView.axis = .vertical
//        subscriptionStackView.backgroundColor = .red
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
            
            subscriptionImageView.heightAnchor.constraint(equalToConstant: 80),
            subscriptionImageView.widthAnchor.constraint(equalToConstant: 80),
            
            subscriptionLabel.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            subscriptionButton.heightAnchor.constraint(equalToConstant: 50),
            subscriptionStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subscriptionStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
        
    }
    
    @objc func subscriptionButtonTapped(){
        print("Subscription Button Tapped")
        delegate?.subscriptionButtonTapped()
    }
}

protocol SubscriptionViewDelegate: AnyObject {
    func subscriptionButtonTapped()
}
