//
//  ISMReelsPlayPauseView+CustomFunctions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 30/12/24.
//

import Foundation
import UIKit

extension ISMReelsPlayPauseView {
    
    func setup() {
        setUpPlayPauseButton()
        setUpConstraints()
    }
    
    func setUpPlayPauseButton() {
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        playPauseImageView.translatesAutoresizingMaskIntoConstraints = false
        playPauseImageView.image = UIImage(resource: .ivspause)
//        playPauseButton.addTarget(self, action: #selector(playPauseTapped), for: .touchUpInside)
        playPauseImageView.tintColor = .black
        hidePlayButtonWithAnimation()
        self.addSubview(playPauseButton)
        playPauseButton.addSubview(playPauseImageView)
        addTapGestures()
    }
    
    private func addTapGestures() {
          // Single Tap Gesture
          let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
          singleTap.numberOfTapsRequired = 1

          // Double Tap Gesture
          let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
          doubleTap.numberOfTapsRequired = 2

          // Prevent single tap from firing when double-tap is detected
          singleTap.require(toFail: doubleTap)

          // Add gestures to the button
        playPauseButton.addGestureRecognizer(singleTap)
        playPauseButton.addGestureRecognizer(doubleTap)
      }
    
    @objc private func handleSingleTap() {
        print("Single Tap Detected")
        // Your single-tap action here
        playPauseTapped()
    }
        
        @objc private func handleDoubleTap() {
            print("Double Tap Detected")
            // Your double-tap action here
            delegate?.reelsViewDoubleTapped()
            
            
        }

    func setUpConstraints(){
        NSLayoutConstraint.activate([
            playPauseImageView.centerXAnchor.constraint(equalTo: centerXAnchor , constant: 30),
            playPauseImageView.centerYAnchor.constraint(equalTo: centerYAnchor) ,
            playPauseImageView.widthAnchor.constraint(equalToConstant: 50),
            playPauseImageView.heightAnchor.constraint(equalToConstant: 50),
            
            playPauseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            playPauseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            playPauseButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            playPauseButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    @objc func playPauseTapped() {
        isPlaying.toggle()
//        playPauseButton.tintColor = .black
        playPauseImageView.tintColor = .black
        if isPlaying {
//            playPauseButton.setImage(UIImage(resource: .ivspause), for: .normal)
            playPauseImageView.image = UIImage(resource: .ivspause)
            hidePlayButtonWithAnimation()
        } else{
//            playPauseButton.setImage(UIImage(resource: .ivsplay), for: .normal)
            playPauseImageView.image = UIImage(resource: .ivsplay)
            showPlayButtonWithAnimation()
            
        }
        delegate?.reelsViewDidPlayPauseTapped(isPlaying: !isPlaying)
    }
    

    
    func hidePlayButtonWithAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            UIView.animate(withDuration: 0.3, animations: {
                // Set the button's tint color to clear
//                self?.playPauseButton.tintColor = .clear
                self?.playPauseImageView.tintColor = .clear
            })
        }
    }

    func showPlayButtonWithAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            UIView.animate(withDuration: 0.3, animations: {
                // Set the button's tint color to clear
                self?.playPauseButton.tintColor = .clear
                self?.playPauseImageView.tintColor = .clear
            })
        }
    }
}
