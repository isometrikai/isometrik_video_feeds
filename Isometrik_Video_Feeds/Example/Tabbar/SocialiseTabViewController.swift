//
//  ISMTabViewController.swift
//  ISM
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController , UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        self.delegate = self
    }
    
    func setUpTabBar() {
        // Create view controllers for each tab
        let reelsVC = ParentViewController()
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
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        setTabSelectionPlaybackForReels(viewController: viewController)
    }
    
    func setTabSelectionPlaybackForReels(viewController : UIViewController){
        if self.viewControllers?.first(where: { $0 is ParentViewController }) is ParentViewController {
            if viewController is ParentViewController {
                // Notify ISMReelsViewController to play video
                ISMReelsUtility.postPlayVideoPlayback()
            } else {
                // Notify ISMReelsViewController to stop video
                ISMReelsUtility.postStopVideoPlayback()
            }
        }
    }
}
