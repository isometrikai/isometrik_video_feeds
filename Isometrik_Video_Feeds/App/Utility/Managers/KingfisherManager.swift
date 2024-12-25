//
//  KingfisherManager.swift
//  DemoIGLIstKit
//
//  Created by 3embed on 17/12/24.
//

import UIKit
import Kingfisher

class FeedsKingfisherManager {
    // MARK: - Singleton Instance
    static let shared = FeedsKingfisherManager()
    
    // MARK: - Private Initializer
    private init() {}
    
    // MARK: - Set Image Method
    func setImage(image: String?, imageView: UIImageView) {
        guard let imageUrlString = image, let url = URL(string: imageUrlString) else {
            imageView.image = UIImage(resource: .dummyimage) // Placeholder on failure
            return
        }
        
        DispatchQueue.main.async {
            imageView.kf.setImage(
                with: url,
                placeholder: UIImage(resource: .dummyimage),
                options: [.transition(.fade(0.3)), .cacheOriginalImage],
                completionHandler: { result in
                    switch result {
                    case .success:
                       //Image loaded successfully
                        break
                    case .failure(let error):
                        print("Failed to load image: \(error.localizedDescription)")
                    }
                }
            )
        }
    }
}

