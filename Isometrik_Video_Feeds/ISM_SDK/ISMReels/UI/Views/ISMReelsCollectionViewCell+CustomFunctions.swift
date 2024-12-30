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
        addObservers()
        configureReelsBackgroundView()
        configureImageView()
    }
    /// Add Observers for Reels Cell
    func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(stopVideo), name: .stopVideoPlayback, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playVideo), name: .playVideoPlayback, object: nil)
        // Add observer for when the video finishes playing
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(videoDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player?.currentItem
        )
        
    }
    
    @objc func videoDidFinishPlaying() {
//        ISMReelsUtility.postScrollToNextVideo()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
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
                playPauseView.isHidden = true
                socialView.muteButton.isHidden = true
            case .video:
                configureVideo(videoUrl: mediaUrl)
                playPauseView.isHidden = false
                socialView.muteButton.isHidden = false
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
        socialView.translatesAutoresizingMaskIntoConstraints = false
        reelsImageView.addSubview(socialView)
        
    }
    /// Sets the styling of bottom description view on the reels cell
    func configureBottomView() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        reelsImageView.addSubview(bottomView)
    }
    /// Configure the play pause view
    func configurePlayPauseView() {
        playPauseView.translatesAutoresizingMaskIntoConstraints = false
        playPauseView.delegate = self
        reelsImageView.addSubview(playPauseView)
        
    }
    /// Configures the constarints of the reels cell
    func configureConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for reelsBackgroundView
            reelsBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            reelsBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reelsBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            reelsBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Constraints for reelsImageView
            reelsImageView.leadingAnchor.constraint(equalTo: reelsBackgroundView.leadingAnchor),
            reelsImageView.trailingAnchor.constraint(equalTo: reelsBackgroundView.trailingAnchor),
            reelsImageView.topAnchor.constraint(equalTo: reelsBackgroundView.topAnchor),
            reelsImageView.bottomAnchor.constraint(equalTo: reelsBackgroundView.bottomAnchor),
            
            // Constraints for socialView
            socialView.trailingAnchor.constraint(equalTo: reelsImageView.trailingAnchor),
            socialView.bottomAnchor.constraint(equalTo: reelsImageView.bottomAnchor),
            socialView.widthAnchor.constraint(equalTo: reelsImageView.widthAnchor, multiplier: 0.2),
            socialView.heightAnchor.constraint(equalTo: reelsImageView.heightAnchor, multiplier: 1.0),
            
            // Constraints for bottomView
            bottomView.trailingAnchor.constraint(equalTo: socialView.leadingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: reelsImageView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: reelsImageView.leadingAnchor),
            
            // Center the playPauseButton in the reelsImageView
            playPauseView.centerXAnchor.constraint(equalTo: reelsImageView.centerXAnchor),
            playPauseView.centerYAnchor.constraint(equalTo: reelsImageView.centerYAnchor),
            playPauseView.heightAnchor.constraint(equalToConstant: 50),
            playPauseView.widthAnchor.constraint(equalToConstant: 50)
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
    @objc func playVideo() {
        player?.play()
    }
    /// Stops the video from playing
    @objc func stopVideo() {
        player?.pause()
    }
}
