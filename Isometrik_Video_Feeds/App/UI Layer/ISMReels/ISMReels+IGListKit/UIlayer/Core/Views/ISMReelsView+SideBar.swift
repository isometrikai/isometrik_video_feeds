//
//  ReelsView+SideBar.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit

class ReelsSideBarSocialView : UIView{
    //vstack
    var buttonsStackView : UIStackView = UIStackView()
    //mute
    var muteButton = UIButton()
    //like + count
    var likesButton = UIButton()
    var likesCount = UILabel()
    //views + count
    var viewsButton = UIButton()
    var viewsCount = UILabel()
    //comment + count
    var commentsButton = UIButton()
    var commentsCount = UILabel()
    //share
    var shareButton = UIButton()
    //more
    var moreButton = UIButton()
    
    //MARK: -Declarations
    var socialButtons : [ISMReelsSocialButtons] = [.mute , .like , .views , .comment , .share , .more]
    let width = 30.0
    let labelwidth = 20.0
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
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
    
    func setupMuteButton(){
        muteButton.translatesAutoresizingMaskIntoConstraints = false
        muteButton.setImage(UIImage(resource: .mute), for: .normal)
        muteButton.addTarget(self, action: #selector(muteTapped), for: .touchUpInside)
        muteButton.imageView?.contentMode = .scaleAspectFit
        buttonsStackView.addArrangedSubview(muteButton)
    }
    
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
    
    func setupShareButton(){
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setImage(UIImage(resource: .share), for: .normal)
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        shareButton.imageView?.contentMode = .scaleAspectFit
        buttonsStackView.addArrangedSubview(shareButton)
    }
    
    func setupMoreutton(){
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.setImage(UIImage(resource: .more), for: .normal)
        moreButton.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
        moreButton.imageView?.contentMode = .scaleAspectFit
        buttonsStackView.addArrangedSubview(moreButton)
    }
    
    func setUpConstraints(){
        let constraints : [NSLayoutConstraint] = [
            likesButton.heightAnchor.constraint(equalToConstant: width),
            likesButton.widthAnchor.constraint(equalToConstant: width),
            likesCount.heightAnchor.constraint(equalToConstant: labelwidth),
            
            viewsButton.heightAnchor.constraint(equalToConstant: width),
            viewsButton.widthAnchor.constraint(equalToConstant: width),
            viewsCount.heightAnchor.constraint(equalToConstant: labelwidth),
            
            commentsButton.heightAnchor.constraint(equalToConstant: width),
            commentsButton.widthAnchor.constraint(equalToConstant: width),
            commentsCount.heightAnchor.constraint(equalToConstant: labelwidth),
            
            shareButton.heightAnchor.constraint(equalToConstant: width),
            shareButton.widthAnchor.constraint(equalToConstant: width),
           
            moreButton.heightAnchor.constraint(equalToConstant: width),
            moreButton.widthAnchor.constraint(equalToConstant: width),
          
            muteButton.heightAnchor.constraint(equalToConstant: width),
            muteButton.widthAnchor.constraint(equalToConstant: width),

            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 50),
            
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
    @objc func muteTapped(){
        print("mute Tapped")
    }
    
    @objc func likeTapped(){
        print("like Tapped")
    }
    
    @objc func viewsTapped(){
        print("Views Tapped")
    }
    
    @objc func commentsTapped(){
        print("Comments Tapped")
    }
    
    @objc func shareTapped(){
        print("Share Tapped")
    }

    @objc func moreTapped(){
        print("More Tapped")
    }
    
}
