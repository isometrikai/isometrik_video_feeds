//
//  ISMReelsView+SideBar+CustomFunctions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

extension ISMReelsSideBarSocialView{
    /// Styles the Side Bar with necessary Buttons
    func setUpUI(){
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 2
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonsStackView)
        for button in socialButtons{
            switch button{
            case .mute:
                setupMuteButton()
            case .like:
                setupLikesButtonAndLikesCount()
            case .views:
                setupViewsButtonAndViewsCount()
            case .comment:
                setupCommentsButtonAndCommentsCount()
            case .share:
                setupShareButton()
            case .more:
                setupMoreutton()
            }
        }
    }
    /// Styles the Mute Button
    func setupMuteButton(){
        muteButton.translatesAutoresizingMaskIntoConstraints = false
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: muteButton, countButton:label, imageName: .ivsmute, selector: #selector(muteTapped))
    }
    /// Styles the like button and Count Label
    func setupLikesButtonAndLikesCount(){
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: likesButton, countButton: likesCount, imageName: .unLike, selector: #selector(likeTapped),countButtonSelector: #selector(likecountTapped),count: "0")
    }
    /// Styles the views Button And Views label
    func setupViewsButtonAndViewsCount(){
        viewsButton.translatesAutoresizingMaskIntoConstraints = false
        viewsCount.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: viewsButton, countButton: viewsCount, imageName: .views , selector: #selector(viewsTapped),count: "0")
    }
    /// Styles the comments Button and Comments Label
    func setupCommentsButtonAndCommentsCount(){
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        commentsCount.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: commentsButton, countButton: commentsCount, imageName: .comments, selector: #selector(commentsTapped),count: "0")
    }
    /// Styles the Share Button
    func setupShareButton(){
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: shareButton, countButton: label, imageName: .ivsshare, selector: #selector(shareTapped))
    }
    /// Styles the More button
    func setupMoreutton(){
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: moreButton, countButton: label, imageName: .ivsmore, selector: #selector(moreTapped))
    }
    
    func setupsButtonAndCount(button : UIButton , countButton : UIButton , imageName : ImageResource ,  selector : Selector ,countButtonSelector : Selector? = nil ,count : String = " ") {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.spacing = 0
        vStack.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(resource: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: selector, for: .touchUpInside)
    
        countButton.translatesAutoresizingMaskIntoConstraints = false
        countButton.setTitle(count, for: .normal)
        countButton.titleLabel?.font = .systemFont(ofSize: 12 , weight: .bold)
        countButton.setTitleColor(UIColor(resource: .sOwhite), for: .normal)
        countButton.titleLabel?.textAlignment = .center
        countButton.addTarget(self, action: countButtonSelector ?? #selector(countButtonTapped), for: .touchUpInside)
        
        vStack.addArrangedSubview(button)
        vStack.addArrangedSubview(countButton)
        buttonsStackView.addArrangedSubview(vStack)
    }
    
    @objc func countButtonTapped() {
        
    }
    /// Set up constraints for the side bar vIew
    func setUpConstraints(){
        let constraints : [NSLayoutConstraint] = [
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            buttonsStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 40),
            buttonsStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
