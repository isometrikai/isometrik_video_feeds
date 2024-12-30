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
        buttonsStackView.spacing = 10
        buttonsStackView.distribution = .fill
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
        muteButton.setImage(UIImage(resource: .mute), for: .normal)
        muteButton.addTarget(self, action: #selector(muteTapped), for: .touchUpInside)
        muteButton.imageView?.contentMode = .scaleAspectFit
        buttonsStackView.addArrangedSubview(muteButton)
    }
    /// Styles the like button and Count Label
    func setupLikesButtonAndLikesCount(){
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.translatesAutoresizingMaskIntoConstraints = false
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        likesButton.setImage(UIImage(resource: .like), for: .normal)
        likesButton.imageView?.contentMode = .scaleAspectFit
        likesButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        likesCount.text = "0"
        likesCount.textColor = .white
        likesCount.textAlignment = .center
        
        vStack.addArrangedSubview(likesButton)
        vStack.addArrangedSubview(likesCount)
        buttonsStackView.addArrangedSubview(vStack)
        
    }
    /// Styles the views Button And Views label
    func setupViewsButtonAndViewsCount(){
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.translatesAutoresizingMaskIntoConstraints = false
        viewsButton.translatesAutoresizingMaskIntoConstraints = false
        viewsButton.setImage(UIImage(resource: .views), for: .normal)
        viewsButton.imageView?.contentMode = .scaleAspectFit
        viewsButton.addTarget(self, action: #selector(viewsTapped), for: .touchUpInside)
        
        viewsCount.translatesAutoresizingMaskIntoConstraints = false
        viewsCount.text = "0"
        viewsCount.textColor = .white
        viewsCount.textAlignment = .center
        
        vStack.addArrangedSubview(viewsButton)
        vStack.addArrangedSubview(viewsCount)
        buttonsStackView.addArrangedSubview(vStack)
        
    }
    /// Styles the comments Button and Comments Label
    func setupCommentsButtonAndCommentsCount(){
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.translatesAutoresizingMaskIntoConstraints = false
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        commentsButton.setImage(UIImage(resource: .comments), for: .normal)
        commentsButton.imageView?.contentMode = .scaleAspectFit
        commentsButton.addTarget(self, action: #selector(commentsTapped), for: .touchUpInside)
        
        commentsCount.translatesAutoresizingMaskIntoConstraints = false
        commentsCount.text = "0"
        commentsCount.textColor = .white
        commentsCount.textAlignment = .center
        
        vStack.addArrangedSubview(commentsButton)
        vStack.addArrangedSubview(commentsCount)
        buttonsStackView.addArrangedSubview(vStack)
        
    }
    /// Styles the Share Button
    func setupShareButton(){
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setImage(UIImage(resource: .share), for: .normal)
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        shareButton.imageView?.contentMode = .scaleAspectFit
        buttonsStackView.addArrangedSubview(shareButton)
    }
    /// Styles the More button
    func setupMoreutton(){
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.setImage(UIImage(resource: .more), for: .normal)
        moreButton.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
        moreButton.imageView?.contentMode = .scaleAspectFit
        buttonsStackView.addArrangedSubview(moreButton)
    }
    /// Set up constraints for the side bar vIew
    func setUpConstraints(){
        let constraints : [NSLayoutConstraint] = [
            likesButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
            likesButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
            likesCount.heightAnchor.constraint(equalToConstant: labelHeight),
            
            viewsButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
            viewsButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
            viewsCount.heightAnchor.constraint(equalToConstant: labelHeight),
            
            commentsButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
            commentsButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
            commentsCount.heightAnchor.constraint(equalToConstant: labelHeight),
            
            shareButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
            shareButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
            
            moreButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
            moreButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
            
            muteButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
            muteButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
            
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 50),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
