//
//  PlayPauseView.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 26/12/24.
//

import Foundation
import UIKit

class ISMReelsPlayPauseView : UIView {
    var playPauseButton = UIButton()
    var isPlaying = true
    var delegate : ISMReelsViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ISMReelsPlayPauseView {
    
    func setup() {
        setUpPlayPauseButton()
        setUpConstraints()
    }
    
    func setUpPlayPauseButton() {
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        playPauseButton.setImage(.pause, for: .normal)
        playPauseButton.addTarget(self, action: #selector(playPauseTapped), for: .touchUpInside)
        self.addSubview(playPauseButton)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playPauseButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playPauseButton.widthAnchor.constraint(equalToConstant: 100),
            playPauseButton.heightAnchor.constraint(equalToConstant: 100),
            ])
    }
    
    @objc func playPauseTapped() {
        isPlaying.toggle()
        if isPlaying {
            playPauseButton.setImage(.pause , for: .normal)
        } else{
            playPauseButton.setImage(.play, for: .normal)
        }
        delegate?.reelsViewDidPlayPauseTapped(isPlaying: !isPlaying)
    }
    
    func hidePlayButtonWithAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            UIView.animate(withDuration: 0.3, animations: {
                self?.playPauseButton.alpha = 0
            })
        }
    }

}

protocol ISMReelsViewDelegate{
    func reelsViewDidPlayPauseTapped(isPlaying: Bool)
}
