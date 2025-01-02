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
        
        // Initialize Config with the desired flow
        config = Config(delegate: self, flow: .reels, parentViewController: self)
        config?.setup()
    }
}

extension ParentViewController: ISMConfig {
    func openProfile() {
        print("Open Profile from parent")
        // Implement profile opening logic here
    }

    func openCoins() {
        print("Open Coins from parent ")
        // Implement coins opening logic here
    }
}
