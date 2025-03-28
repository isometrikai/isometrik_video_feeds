//
//  IVSPostLikeView.swift
//  PicoAdda
//
//  Created by 3embed on 19/03/25.
//  Copyright © 2025 Rahul Sharma. All rights reserved.
//

import Foundation
import UIKit

class IVSPostLikeView : UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .ivsHeart))
        imageView.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        imageView.alpha = 0 // Start hidden
        return imageView
    }()
    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    
    private func setupUI() {
        // Add subviews
        addSubview(imageView)
        // Constraints for image View
        self.imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    func showImageWithBounceEffect() {
           self.imageView.isHidden = false
           imageView.alpha = 1
           imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5) // Start small
           
           UIView.animate(withDuration: 0.5,
                          delay: 0,
                          usingSpringWithDamping: 0.1,
                          initialSpringVelocity: 3,
                          options: .curveEaseInOut,
                          animations: {
               self.imageView.transform = .identity
           }) { _ in
               // Hide after delay
               self.hideImage()
           }
       }
       
       func hideImage() {
           UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseOut, animations: {
               self.imageView.alpha = 0
           }) { _ in
               self.imageView.isHidden = true
           }
       }
}
