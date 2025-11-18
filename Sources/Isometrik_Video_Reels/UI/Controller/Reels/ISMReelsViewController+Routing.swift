//
//  ISMReelsViewController+Routing.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 25/12/24.
//

import Foundation

extension ISMReelsViewController {
    // MARK: - Setup Methods
    
    func fetchData() {
        CacheManager.shared.clearCachedReels()
        self.dataSource.cachedReels = CacheManager.shared.loadCachedReels()
        self.reelsCollectionView.isHidden = false
        self.adapter.performUpdates(animated: false)
        
        viewModel.fetchReelsContent(offset: viewModel.offset) { [weak self] in
            guard let self = self else { return }
            self.dataSource.updateFeeds(reels: self.viewModel.reels)
            followingStackView.isHidden = true
            findPeopleButton.isHidden = true
            findPeopleButtonStackView.isHidden = true
            self.adapter.performUpdates(animated: false)
            self.refreshControl.endRefreshing()
        } failure: { error in
            print(error)
        }
    }
    func fetchExclusiveData() {
        viewModel.fetchExclusiveContent(offset: viewModel.exclusiveOffset) { [weak self] in
            guard let self = self else { return }
            self.dataSource.updateExclusiveFeeds(reels: self.viewModel.exclusiveReels)
            self.refreshControl.endRefreshing()
            followingStackView.isHidden = true
            findPeopleButton.isHidden = true
            findPeopleButtonStackView.isHidden = true
            self.adapter.performUpdates(animated: false)
        } failure: { error in
            print(error)
        }
    }
    
    func fetchHomeData() {
        viewModel.fetchHomeContent(offset: viewModel.homeOffset, success: { [weak self] in
            guard let self = self else { return }
            IVSReelsUtility.showPopularUsers = false
            self.dataSource.updateHomeFeeds(reels: self.viewModel.homeReels)
            self.refreshControl.endRefreshing()
            self.adapter.performUpdates(animated: false)
            
            //set up ui
            
            followingStackView.isHidden = true
            findPeopleButton.isHidden = true
            findPeopleButtonStackView.isHidden = true
 
        }, failure: {[weak self] error in
            guard let self = self else { return }
            print(error)
            DispatchQueue.main.async {
               
                IVSReelsUtility.showPopularUsers = true
                self.refreshControl.endRefreshing()
                if self.dataSource.homeFeedsIsEmpty() {
                    self.fetchPopularData()
                }
            }
        })
    }
    
    func fetchPopularData() {
        self.viewModel.fetchPopularUserContent { [weak self] in
            guard let self = self else { return }
            self.dataSource.updatePopularUser(popularUser: self.viewModel.popularUser)
            self.refreshControl.endRefreshing()
            self.adapter.performUpdates(animated: false)
            
            
            followingStackView.isHidden = false
            findPeopleButton.isHidden = false
            findPeopleButtonStackView.isHidden = false
            IVSReelsUtility.showPopularUsers = true
           
            
        } failure :{ error in
            IVSReelsUtility.showPopularUsers = false
             print("Error")
         }
    }
}
