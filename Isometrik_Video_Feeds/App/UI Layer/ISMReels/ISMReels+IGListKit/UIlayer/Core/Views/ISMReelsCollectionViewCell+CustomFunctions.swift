//
//  ISMReelsCollectionViewCell+CustomFunctions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit
import AVFoundation

extension ISMReelsCollectionViewCell{
    //MARK: - Custom Functions
    /// Default setup of the cell requires the backgroundView and the imageView to load . In case there is no image a dummy Image would be set
   func configureUI() {
       configureReelsBackgroundView()
       configureImageView()
   }
    /// Passing url on the basis of if the  url is for image or video
    /// - Parameters:
    ///   - url: takes url of the image or video
    ///   - mediaType: take the type of media weather its an image or a video
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
    /// Sets the styling of container view on the reels cell
    func configureReelsBackgroundView() {
        reelsBackgroundView = UIView()
        reelsBackgroundView.defaultViewStyle()
        reelsBackgroundView.backgroundColor = .sOblack
        contentView.addSubview(reelsBackgroundView)
    }
    /// Sets the styling of image view on the reels cell
    func configureImageView() {
        reelsImageView = UIImageView()
        reelsImageView.defaultImageViewStyle()
        reelsImageView.image = UIImage(resource: .dummyimage)
        reelsImageView.isUserInteractionEnabled = true
        reelsBackgroundView.addSubview(reelsImageView)
    }
    /// Sets the styling of side bar view on the reels cell
    func configureSocialView() {
        reelsImageView.addSubview(socialView)
        socialView.translatesAutoresizingMaskIntoConstraints = false
    }
    /// Sets the styling of bottom description view on the reels cell
    func configureBottomView() {
        reelsImageView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
    }
    /// Configures the constarints of the reels cell
    func configureConstraints() {
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
    /// Sets the player layer on the cell and plays the video
    /// - Parameter videoUrl: takes url that is in .mp4 format for playing the video
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
    /// Plays the video
    func playVideo() {
        player?.play()
    }
    /// Stops the video from playing
    func stopVideo() {
        player?.pause()
    }
}
