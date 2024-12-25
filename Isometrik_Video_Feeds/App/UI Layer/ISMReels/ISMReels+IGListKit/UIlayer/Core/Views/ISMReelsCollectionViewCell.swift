//
//  CollectionViewCell.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import UIKit
import AVFoundation

class ISMReelsCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    
    var reelsBackgroundView: UIView!
    var reelsImageView: UIImageView!
    
    //MARK: - Declarations
    
    private let socialView = ReelsSideBarSocialView()
    private let bottomView = ReelsBottomView()
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    //MARK: - Initialisers and Deinitialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = CGRect(x: 0, y: 10, width: self.contentView.bounds.width, height: self.contentView.bounds.height)
    }
    
    deinit {
        print("SOReelsCollectionViewCell deinitialised")
    }
    
   //MARK: - Setting up Cell
    func setUpCell(data : ISMReels){
        bottomView.nameLabel.text = data.name
        configureMedia(url: data.ImageUrl, mediaType: data.mediaType)
        //set up the remaining UI over the image or video
        setUpSocialView()
        setUpBottomView()
        setUpConstraints()
    }
}


extension ISMReelsCollectionViewCell{
    //MARK: - Custom Functions
    /// Default setup of the cell requires the backgroundView and the imageView to load . In case there is no image a dummy Image would be set
   func configureUI() {
        setUpReelsBackgroundView()
        setUpImageView()
    }
    func configureMedia(url : String , mediaType : Int){
        var mediaUrl = url
        mediaUrl = mediaUrl.replacingOccurrences(of: "http", with: "https") // as the urls are not having https in my json
        switch ISMReelsMediaType(rawValue: mediaType){
        case .none:
            break
        case .some(let type ):
            switch type{
            case .image:
                FeedsKingfisherManager.shared.setImage(image: mediaUrl, imageView: reelsImageView)
            case .video:
                configureVideo(videoUrl: mediaUrl)
            }
        }
    }

    func setUpReelsBackgroundView() {
        reelsBackgroundView = UIView()
        reelsBackgroundView.defaultViewStyle()
        reelsBackgroundView.backgroundColor = .sOblack
        contentView.addSubview(reelsBackgroundView)
    }
    
    func setUpImageView() {
        reelsImageView = UIImageView()
        reelsImageView.defaultImageViewStyle()
        reelsImageView.image = UIImage(resource: .dummyimage)
        reelsImageView.isUserInteractionEnabled = true
        reelsBackgroundView.addSubview(reelsImageView)
    }
    
    func setUpSocialView() {
        reelsImageView.addSubview(socialView)
        socialView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpBottomView() {
        reelsImageView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            reelsBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            reelsBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reelsBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            reelsBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            reelsImageView.leadingAnchor.constraint(equalTo: reelsBackgroundView.leadingAnchor),
            reelsImageView.trailingAnchor.constraint(equalTo: reelsBackgroundView.trailingAnchor),
            reelsImageView.topAnchor.constraint(equalTo: reelsBackgroundView.topAnchor),
            reelsImageView.bottomAnchor.constraint(equalTo: reelsBackgroundView.bottomAnchor),
            
            socialView.trailingAnchor.constraint(equalTo: reelsImageView.trailingAnchor),
            socialView.bottomAnchor.constraint(equalTo: reelsImageView.bottomAnchor),
            socialView.widthAnchor.constraint(equalTo: reelsImageView.widthAnchor, multiplier: 0.2),
            socialView.heightAnchor.constraint(equalTo: reelsImageView.heightAnchor, multiplier: 1.0),
            
            bottomView.trailingAnchor.constraint(equalTo: socialView.leadingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: reelsImageView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: reelsImageView.leadingAnchor),
        ])
    }
    
    func configureVideo(videoUrl: String) {
        // Ensure the URL is valid
        guard let videoURL = URL(string: videoUrl) else {
            print("Invalid video URL")
            return
        }
        // Remove any existing player layer from the view
            if let existingLayer = playerLayer {
                existingLayer.removeFromSuperlayer()
            }
        
        // Initialize the AVPlayer with the video URL
        player = AVPlayer(url: videoURL)
      

        // Initialize the AVPlayerLayer and set its properties
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspect // Set the video gravity

        // Add the player layer to the view
        if let playerLayer = playerLayer {
            playerLayer.frame = CGRect(x: 0, y: 10, width: self.contentView.bounds.width, height: self.contentView.bounds.height) // Ensure the player layer matches the backgroundView's bounds
            reelsImageView.layer.addSublayer(playerLayer)
        }

        // Start playing the video
        player?.play()
    }

    
    func playVideo() {
        player?.play()
    }
    
    func stopVideo() {
        player?.pause()
    }
}
