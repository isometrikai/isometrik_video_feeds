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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: muteButton, label: label, imageName: .mute, selector: #selector(muteTapped))
    }
    /// Styles the like button and Count Label
    func setupLikesButtonAndLikesCount(){
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: likesButton, label: likesCount, imageName: .unLike, selector: #selector(likeTapped),count: "0")
    }
    /// Styles the views Button And Views label
    func setupViewsButtonAndViewsCount(){
        viewsButton.translatesAutoresizingMaskIntoConstraints = false
        viewsCount.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: viewsButton, label: viewsCount, imageName: .views , selector: #selector(viewsTapped),count: "0")
    }
    /// Styles the comments Button and Comments Label
    func setupCommentsButtonAndCommentsCount(){
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        commentsCount.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: commentsButton, label: commentsCount, imageName: .comments, selector: #selector(commentsTapped),count: "0")
    }
    /// Styles the Share Button
    func setupShareButton(){
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: shareButton, label: label, imageName: .share, selector: #selector(shareTapped))
    }
    /// Styles the More button
    func setupMoreutton(){
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        setupsButtonAndCount(button: moreButton, label: label, imageName: .more, selector: #selector(moreTapped))
    }
    
    func setupsButtonAndCount(button : UIButton , label : UILabel , imageName : ImageResource ,  selector : Selector ,count : String = " ") {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(resource: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = count
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        
        vStack.addArrangedSubview(button)
        vStack.addArrangedSubview(label)
        buttonsStackView.addArrangedSubview(vStack)
    }
    
    /// Set up constraints for the side bar vIew
    func setUpConstraints(){
        let constraints : [NSLayoutConstraint] = [
//            likesButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
//            likesButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
//            likesCount.heightAnchor.constraint(equalToConstant: labelHeight),
//            
//            viewsButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
//            viewsButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
//            viewsCount.heightAnchor.constraint(equalToConstant: labelHeight),
//            
//            commentsButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
//            commentsButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
//            commentsCount.heightAnchor.constraint(equalToConstant: labelHeight),
//            
//            shareButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
//            shareButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
//            
//            moreButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
//            moreButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
//            
//            muteButton.heightAnchor.constraint(equalToConstant: socialButtonsWidth),
//            muteButton.widthAnchor.constraint(equalToConstant: socialButtonsWidth),
            
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 50),
            buttonsStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
