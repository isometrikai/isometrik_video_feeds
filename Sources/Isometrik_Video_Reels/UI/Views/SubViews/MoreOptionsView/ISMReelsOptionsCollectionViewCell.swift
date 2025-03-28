//
//  ISMReelsOptionsCollectionViewCell.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 31/12/24.
//

import Foundation
import UIKit

class ISMReelsOptionsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ISMReelsOptionsCollectionViewCell"
    
    var optionsImageView: UIImageView!
    var optionsLabel: UILabel!
    var containerView: UIView!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
      
    }
    
    func setUp() {
        // Container View for rounded corners and border
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.backgroundColor = UIColor.clear
        contentView.addSubview(containerView)
        
        // Image View
        optionsImageView = UIImageView()
        optionsImageView.translatesAutoresizingMaskIntoConstraints = false
        optionsImageView.contentMode = .scaleAspectFit
        containerView.addSubview(optionsImageView)
        
        // Label
        optionsLabel = UILabel()
        optionsLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsLabel.font = UIFont.systemFont(ofSize: 14)
        optionsLabel.textAlignment = .center
        optionsLabel.textColor = .black
        containerView.addSubview(optionsLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
     
            optionsImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            optionsImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            optionsImageView.widthAnchor.constraint(equalToConstant: 40),
            optionsImageView.heightAnchor.constraint(equalToConstant: 40),
            
            optionsLabel.topAnchor.constraint(equalTo: optionsImageView.bottomAnchor, constant: 5),
            optionsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            optionsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            optionsLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -10)
            
            
        ])
    }
    
    func configure(option: IVSMediaOptions, color: UIColor) {
        containerView.layer.borderColor = color.cgColor
        
        switch option {
        case .bookmark:
            optionsImageView.image = UIImage(systemName: "bookmark")
            optionsLabel.text = "Bookmark"
        case .share:
            optionsImageView.image = UIImage(systemName: "square.and.arrow.up")
            optionsLabel.text = "Share"
        case .download:
            optionsImageView.image = UIImage(systemName: "arrow.down.circle")
            optionsLabel.text = "Download"
        case .copyLink:
            optionsImageView.image = UIImage(systemName: "link")
            optionsLabel.text = "Copy Link"
        case .record:
            optionsImageView.image = UIImage(systemName: "record.circle")
            optionsLabel.text = "Record"
        case .report:
            optionsImageView.image = UIImage(systemName: "flag")
            optionsLabel.text = "Report"
        }
    }
}
