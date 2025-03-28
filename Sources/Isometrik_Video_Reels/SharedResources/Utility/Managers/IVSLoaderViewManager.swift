//
//  IVSLoaderViewManager.swift
//  PicoAdda
//
//  Created by 3embed on 10/02/25.
//  Copyright © 2025 Rahul Sharma. All rights reserved.
//

import Foundation
import UIKit

class IVSLoaderView: UIView {
    
    private static let shared = IVSLoaderView()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private init() {
        super.init(frame: UIScreen.main.bounds)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    static func show(size: CGFloat = 80, color: UIColor = .white, backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.5)) {
        guard let window = UIApplication.shared.connectedScenes
                .compactMap({ ($0 as? UIWindowScene)?.windows.first(where: { $0.isKeyWindow }) })
                .first else { return }
        
        let loader = IVSLoaderView.shared
        loader.frame = window.bounds
        loader.activityIndicator.color = color
        loader.backgroundColor = backgroundColor
        window.addSubview(loader)
        loader.activityIndicator.startAnimating()
    }
    
    static func hide() {
        DispatchQueue.main.async {
            IVSLoaderView.shared.activityIndicator.stopAnimating()
            IVSLoaderView.shared.removeFromSuperview()
        }
    }
}
