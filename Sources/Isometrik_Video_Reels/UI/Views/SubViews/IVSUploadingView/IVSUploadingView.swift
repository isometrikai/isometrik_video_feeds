//
//  IVSUploadingView.swift
//  PicoAdda
//
//  Created by 3embed on 06/03/25.
//  Copyright © 2025 Rahul Sharma. All rights reserved.
//

import UIKit

class UploadProgressView: UIView {
    
    // UI Elements
    private let uploadingTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Uploading"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let uploadProgressPercentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let uploadProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0.0
        progressView.progressTintColor = .blue
        progressView.trackTintColor = .lightGray
        return progressView
    }()
    
    private let uploadViewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private var currentProgress: Float = 0.0  // Store current progress
    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        // Add subviews
        uploadViewStackView.addArrangedSubview(uploadingTextLabel)
        uploadViewStackView.addArrangedSubview(uploadProgressPercentageLabel)
        uploadViewStackView.addArrangedSubview(uploadProgressView)
        
        addSubview(uploadViewStackView)
        
        // Constraints for Stack View
        uploadViewStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uploadViewStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            uploadViewStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            uploadViewStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            uploadViewStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    // Function to Update Progress
      func updateProgress(_ progress: Float) {
          uploadProgressView.progress = progress
          uploadProgressPercentageLabel.text = "\(Int(progress * 100))%"
      }
    
    
    // **Smooth Progress Animation**
//    func updateProgress(_ progress: Float) {
//        let targetProgress = min(progress, 1.0)  // Ensure progress doesn't exceed 100%
//        
//        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
//            if self.currentProgress < targetProgress {
//                self.currentProgress += 0.01 // Increment smoothly
//                self.uploadProgressView.setProgress(self.currentProgress, animated: true)
//                self.uploadProgressPercentageLabel.text = "\(Int(self.currentProgress * 100))%"
//            } else {
//                self.currentProgress = targetProgress
//                self.uploadProgressView.setProgress(targetProgress, animated: true)
//                self.uploadProgressPercentageLabel.text = "\(Int(targetProgress * 100))%"
//                timer.invalidate()
//            }
//        }
//    }
}
