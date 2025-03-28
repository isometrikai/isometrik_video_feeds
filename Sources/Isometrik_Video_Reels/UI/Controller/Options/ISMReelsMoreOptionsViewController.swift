//
//  ISMReelsMoreOptionsViewController.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 31/12/24.
//

import UIKit

class ISMReelsMoreOptionsViewController: UIViewController {
    var moreOptionsCollectionView: UICollectionView!
    var moreOptionsButton: UIButton!
    var containerView : UIView!
    var userName : UILabel!
    var views : UILabel!
    var barView : UIView!
    
    //MARK: -Variables
    var mediaOptions: [IVSMediaOptions] = [.bookmark , .share , .download , .copyLink , .record , .report]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    deinit {
        print("ISMReelsMoreOptionsViewController deinitialised")
    }
}

