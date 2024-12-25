//
//  ISMTabViewController.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    func setUpTabBar() {
        // Create view controllers for each tab
        let reelsVC = ISMReelsViewController()
        let feedsVC = FeedsViewController()
        let twitterVC = TwitterViewController()
        
        // Set titles and images for tabs
        reelsVC.tabBarItem = UITabBarItem(title: "Reels", image: UIImage(systemName: "film"), selectedImage: UIImage(systemName: "film.fill"))
        feedsVC.tabBarItem = UITabBarItem(title: "Feeds", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet.rectangle.fill"))
        twitterVC.tabBarItem = UITabBarItem(title: "Twitter", image: UIImage(systemName: "bird"), selectedImage: UIImage(systemName: "bird.fill"))
        
        // Add view controllers to the TabBarController
        self.viewControllers = [reelsVC, feedsVC, twitterVC]
        
        // Customize TabBar appearance
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
    }
}
