//
//  ISMReelsFollowingCollectionViewCell.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 14/01/25.
//

import UIKit



class ISMReelsFollowingCollectionViewCell: UICollectionViewCell {
    static let identifier = "ISMReelsFollowingCollectionViewCell"
    //MARK: - Outlets
    var containerView : UIView!
    var containerStackView : UIStackView!
    //profile
    var profileButton : UIButton!
    //username
    var usernameLabel : UILabel!
    //name
    var nameLabel : UILabel!
    //Follow button
    var popularUserfollowButton : UIButton!
    // Follow button stack View\
    var popularUserfollowButtonStackView : UIStackView!
    //MARK: - Variables
    private var data : ISMPopularUserContent?
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit \(#file)")
    }
    
    func setUpCell(data: ISMPopularUserContent) {
        self.data = data
        self.usernameLabel.text = data.username
        self.nameLabel.text = data.name
        self.popularUserfollowButton.setTitle((data.followStatus == 0 ? "Follow" :"Following") , for: .normal)
        let mediaUrl = data.profileImageUrl
        let placeholder = IVSReelsUtility.getCachedInitialsImage(username: data.username)
        
        // Set the placeholder first to avoid flickering
        profileButton.setImage(placeholder, for: .normal)
        
        IVSReelsUtility.setImageFromUrlForButton(mediaUrl: mediaUrl, button: profileButton, placeholder: placeholder)
    }

}

extension ISMReelsFollowingCollectionViewCell {
    
    //MARK: - Custom Functions
    func configureView() {
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(containerView)
        
        configureProfileButton()
        configureUsernameLabel()
        configureNameLabel()
        configureFollowButton()
    }

    func configureProfileButton() {
        profileButton = UIButton()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setImage(UIImage(resource: .iconProfile), for: .normal) // Placeholder image
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.layer.cornerRadius = 40
        profileButton.clipsToBounds = true
        profileButton.layer.masksToBounds = true
        profileButton.addTarget(self, action: #selector(openProfilePage), for: .touchUpInside)
        containerView.addSubview(profileButton)
    }
    
    func configureUsernameLabel() {
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.textColor = UIColor(resource: .sOwhite)
        usernameLabel.text = "navpreetkaur123"
        usernameLabel.textAlignment = .center
        usernameLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        containerView.addSubview(usernameLabel)
    }
    
    func configureNameLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor(resource: .sOwhite)
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        nameLabel.text = "Navpreet Kaur"
        nameLabel.textAlignment = .center
        containerView.addSubview(nameLabel)
    }
    
    func configureFollowButton() {
        popularUserfollowButtonStackView = UIStackView()
        popularUserfollowButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        popularUserfollowButtonStackView.axis = .horizontal
        popularUserfollowButtonStackView.alignment = .center
        popularUserfollowButtonStackView.distribution = .fill
        containerView.addSubview(popularUserfollowButtonStackView)

        popularUserfollowButton = UIButton()
        popularUserfollowButton.translatesAutoresizingMaskIntoConstraints = false
        popularUserfollowButton.setTitle("Nav", for: .normal)
        popularUserfollowButton.backgroundColor = IVSKit.shared.getThemeColor()
        popularUserfollowButton.layer.cornerRadius = 10
        popularUserfollowButton.setTitleColor(UIColor(resource: .sOwhite), for: .normal)
        popularUserfollowButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        popularUserfollowButton.addTarget(self, action: #selector(followButtonAction), for: .touchUpInside)
        popularUserfollowButtonStackView.addArrangedSubview(popularUserfollowButton)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            //Container View
            self.containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            self.profileButton.topAnchor.constraint(equalTo: containerView.topAnchor , constant: 10),
            self.profileButton.centerXAnchor.constraint(equalTo: popularUserfollowButtonStackView.centerXAnchor),
            self.profileButton.widthAnchor.constraint(equalToConstant: 80),
            self.profileButton.heightAnchor.constraint(equalToConstant: 80),
            
            usernameLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor , constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 20),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor , constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            popularUserfollowButtonStackView.topAnchor.constraint(equalTo: nameLabel.topAnchor , constant: 10),
            popularUserfollowButtonStackView.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            popularUserfollowButtonStackView.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            popularUserfollowButtonStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension ISMReelsFollowingCollectionViewCell {
    @objc func openProfilePage(){
        print("Open Profile Page")
        NotificationCenter.default.post(name: .openProfileViewFromFollowingView, object: nil, userInfo: [
            "memberId": data?.userId ?? "",
            "username" : data?.username ?? ""
        ])
    }
    
    @objc func followButtonAction() {
        print("Follow popular user")
        
        let userInfo : [String:Any] = [
            "followStatus": data?.followStatus ?? 0,
            "followUserID" : data?.userId ?? ""
        ]
        //change the titles
        self.popularUserfollowButton.setTitle(data?.followStatus == 0 ? "Following" : "Follow", for: .normal)
        self.data?.updateFollowStatus(followStatus: data?.followStatus == 0 ? 1 : 0 )
        NotificationCenter.default.post(name: .followAndUnfollowUserFromFollowingView, object: nil, userInfo: userInfo)
       
    }
}
