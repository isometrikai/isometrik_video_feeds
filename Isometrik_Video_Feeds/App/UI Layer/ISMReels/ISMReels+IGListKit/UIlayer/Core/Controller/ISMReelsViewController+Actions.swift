//
//  ISMReelsViewController+Actions.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 25/12/24.
//

import Foundation

extension ISMReelsViewController{
    //MARK: - Actions
    @objc func profileTapped(){
         print("open profile")
    }
    
    @objc func followingTapped(){
        print("open following")
        followingButton.backgroundColor = .soAppBase
        trendingButton.backgroundColor = .soGray
        exclusiveButton.backgroundColor = .soGray
        //call following api
    }
    
    @objc func trendingTapped(){
        print("open trending")
        trendingButton.backgroundColor = .soAppBase
        followingButton.backgroundColor = .soGray
        exclusiveButton.backgroundColor = .soGray
        
        //call trending api
    }
    
    @objc func exclusiveTapped(){
        print("open exclusive")
        exclusiveButton.backgroundColor = .soAppBase
        followingButton.backgroundColor = .soGray
        trendingButton.backgroundColor = .soGray
        
        //call exclusive api
    }
}
