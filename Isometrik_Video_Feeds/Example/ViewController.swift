//
//  ViewController.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 24/12/24.
//

import UIKit

class ParentViewController: UIViewController {
    var config: Config?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupISMKit()
    }
    
    private func setupISMKit() {
           let config = ISMConfiguration(apiKey: "your-api-key")
           
           ISMKit.shared.delegate = self
           ISMKit.shared.presentationDelegate = self
           
           ISMKit.shared.configure(with: config) { result in
               // Handle configuration result
               ISMKit.shared.show(contentType: .reels) { result in
                   //
               }
           }
       }
}

extension ParentViewController: ISMPresentationDelegate {
    func present(viewController: UIViewController) {
        // You control how to present the view controller
                // For example:
                addChild(viewController)
                view.addSubview(viewController.view)
                viewController.view.frame = view.bounds
                viewController.didMove(toParent: self)
    }
    
    func dismiss() {
        // Handle dismissal in your preferred way
             children.forEach { child in
                 child.willMove(toParent: nil)
                 child.view.removeFromSuperview()
                 child.removeFromParent()
             }
    }
    
  
}

extension ParentViewController: ISMDelegate {
    // MARK: - ISMDelegate methods
        
        func didTapProfile() {
            // Handle profile tap
            print("Profile tapped parent vc")
        }
        
        func didTapCoins() {
            // Handle coins tap
            print("Coin tapped parent vc")
        }
        
        func didEncounterError(_ error: ISMError) {
            // Handle errors
        }
}
