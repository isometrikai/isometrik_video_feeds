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
        // Ensure you remove any previous observer before adding a new one
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
       

        
    }
    
    @objc func videoDidFinishPlaying() {
        player?.seek(to: .zero)
        playVideo()
//        ISMReelsUtility.postScrollToNextVideo()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        cleanMedia()
    }
    /// Passing url on the basis of if the  url is for image or video
    /// - Parameters:
    ///   - url: takes url of the image or video
    ///   - mediaType: take the type of media weather its an image or a video
    func configureMedia(url : String , mediaType : Int){
        switch IVSReelsMediaType(rawValue: mediaType){
        case .none:
            break
        case .some(let type ):
            switch type{
            case .image:
                cleanMedia()
                IVSReelsUtility.setImageFromUrl(mediaUrl: url, imageView: reelsImageView)
                playPauseView.isHidden = true
//                bottomView.controlStackView.isHidden = true
                socialView.muteButton.isHidden = true
            case .video:
                configureVideo(videoUrl: url)
                playPauseView.isHidden = false
//                bottomView.controlStackView.isHidden = false
                socialView.muteButton.isHidden = false
            }
        }
    }

    /// Sets the styling of container view on the reels cell
    func configureReelsBackgroundView() {
        reelsBackgroundView = UIView()
        reelsBackgroundView.defaultViewStyle()
        reelsBackgroundView.backgroundColor = UIColor(resource: .sOblack)
        contentView.addSubview(reelsBackgroundView)
    }
    /// Sets the styling of image view on the reels cell
    func configureImageView() {
        reelsImageView = UIImageView()
        reelsImageView.defaultImageViewStyle()
        reelsImageView.image = UIImage(resource: .dummyimage)
        reelsImageView.isUserInteractionEnabled = true
        addReelsImageViewDoubleTapGesture()
        reelsBackgroundView.addSubview(reelsImageView)
    }
    
    func addReelsImageViewDoubleTapGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(reelsImageViewDoubleTapped))
        doubleTap.numberOfTapsRequired = 2
        
        reelsImageView.addGestureRecognizer(doubleTap)
    }
    
    @objc func reelsImageViewDoubleTapped() {
        reelsViewDoubleTapped()
    }
    
    /// Sets the styling of side bar view on the reels cell
    func configureSocialView() {
        socialView.translatesAutoresizingMaskIntoConstraints = false
        socialView.delegate = self
        reelsImageView.addSubview(socialView)
    }
    /// Sets the styling of bottom description view on the reels cell
    func configureBottomView() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.delegate = self
        reelsImageView.addSubview(bottomView)
    }
    /// Configure the play pause view
    func configurePlayPauseView() {
        playPauseView.translatesAutoresizingMaskIntoConstraints = false
        playPauseView.delegate = self
        reelsImageView.addSubview(playPauseView)
        
    }
    
    func configurePostLikeView() {
        postLikeView.translatesAutoresizingMaskIntoConstraints = false
        reelsImageView.addSubview(postLikeView)
    }
    
    func configureBlurView() {
        if !reelsImageView.subviews.contains(blurView) {
            blurView.translatesAutoresizingMaskIntoConstraints = false
            //        blurView.backgroundColor = .systemPink
            reelsImageView.addSubview(blurView)
        }
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
            socialView.centerYAnchor.constraint(equalTo: reelsImageView.centerYAnchor , constant: 30),
            socialView.widthAnchor.constraint(equalTo: reelsImageView.widthAnchor, multiplier: 0.15),
            socialView.heightAnchor.constraint(equalTo: reelsImageView.heightAnchor, multiplier: 0.5),
            
            // Constraints for bottomView
            bottomView.trailingAnchor.constraint(equalTo: reelsImageView.trailingAnchor , constant: -10),
            bottomView.bottomAnchor.constraint(equalTo: reelsImageView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: reelsImageView.leadingAnchor),
            
            // Center the playPauseButton in the reelsImageView
            playPauseView.leadingAnchor.constraint(equalTo: reelsImageView.leadingAnchor),
            playPauseView.trailingAnchor.constraint(equalTo: socialView.leadingAnchor),
            playPauseView.topAnchor.constraint(equalTo: reelsImageView.topAnchor),
            playPauseView.bottomAnchor.constraint(equalTo: reelsImageView.bottomAnchor),
            
            // Center the postLikeView in the reelsImageView
            postLikeView.centerYAnchor.constraint(equalTo: reelsImageView.centerYAnchor),
            postLikeView.centerXAnchor.constraint(equalTo: reelsImageView.centerXAnchor),
            postLikeView.widthAnchor.constraint(equalToConstant: 200),
            postLikeView.heightAnchor.constraint(equalToConstant: 200),
            
            
        ])
    }
    
    func addBlurViewConstraints() {
        NSLayoutConstraint.activate([
        //Blur View
        blurView.topAnchor.constraint(equalTo: reelsImageView.topAnchor),
        blurView.bottomAnchor.constraint(equalTo: reelsImageView.bottomAnchor),
        blurView.leadingAnchor.constraint(equalTo: reelsImageView.leadingAnchor),
        blurView.trailingAnchor.constraint(equalTo: reelsImageView.trailingAnchor),
        ])
    }
    
    func cleanMedia(){
        if let existingLayer = playerLayer {
            existingLayer.removeFromSuperlayer()
        }
        stopVideo()
        // Remove or hide blur view
        blurView.removeFromSuperview()
        blurView.isHidden = true
        // Clear media-related components
        reelsImageView.image = nil
        bottomView.updateProgress(0.0)
        player = nil
        playerLayer = nil
        removeObservers()
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: .playVideoPlayback, object: nil)
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
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
        cleanMedia()
        
        // Initialize the AVPlayer with the video URL
        player = AVPlayer(url: videoURL)
        // Initialize the AVPlayerLayer and set its properties
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill // Set the video gravity
        
        // Add the player layer to the view
        if let playerLayer = playerLayer {
            playerLayer.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: self.contentView.bounds.height) // Ensure the player layer matches the backgroundView's bounds
            reelsImageView.layer.addSublayer(playerLayer)
        }
        // Add observer for when the video finishes playing
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(videoDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player?.currentItem
        )
        
        player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: 600), queue: .main) { [weak self] time in
            guard let self = self, let player = self.player else { return }
            let currentTime = CMTimeGetSeconds(player.currentTime())
            let duration = CMTimeGetSeconds(player.currentItem?.duration ?? CMTime.zero)
            
            if duration > 0 {
                let progress = Float(currentTime / duration)
                self.bottomView.updateProgress(progress)
            }
        }

        // Start playing the video
        playVideo()
    }
    /// Plays the video
    @objc func playVideo() {
        player?.isMuted = IVSReelsUtility.isMute
        switch IVSReelsUtility.selectedReelsCategory {
        case .following :
            if IVSReelsUtility.showPopularUsers {
                stopVideo()
            }else{
                if data?.isPurchased ?? false || data?.postAmount == 0 {
                    player?.play()
                }else {
                    stopVideo()
                }
            }
        case .exclusive :
            //if the post is not purchased or if its not free then don't play
            if data?.isPurchased ?? false || data?.postAmount == 0 {
                player?.play()
            }else {
                stopVideo()
            }
            
        default :
            if data?.isPurchased ?? false || data?.postAmount == 0 {
                player?.play()
            }else {
                stopVideo()
            }
        }
        
    }
    /// Stops the video from playing
    @objc func stopVideo() {
        player?.pause()
    }
}
