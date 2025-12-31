//
//  ISMReelsDataSource.swift
//  ISM
//
//  Created by 3embed on 20/12/24.
//
import Foundation
import IGListKit

class ISMReelsDataSource: NSObject,ListAdapterDataSource{
    var viewModel : ISMReelsViewModel!
    
    private var reels = [ISMReels]()
    private var exclusiveReels = [ISMReels]()
    private var homeFeeds = [ISMReels]()
    private var popularUser : [Any] = []
    var cachedReels : [ISMReels] = []
    //Dummy Cached Data
    /* [
    {
        "_id" = 65fab881b35f7e7bf958b464;
        artist = Test;
        audioStatus = 1;
        audioStatusText = active;
        createdOn = "1710930049107.016";
        duration = 142;
        imageUrl = "https://dubly.gumlet.io/ProductCategory/0/0/large/admin_1710930044.webp";
        musicCategory = 5fd1e458527f711f8a328c8b;
        name = "Bye Bye";
        path = "https://dubly.gumlet.io/audio/0/0/small/admin_1710930046.mp3";
        sequenceId = 119;
    }
    
        .init(name: "testOne", imageUrl: "https://dubly.gumlet.io/dubly/videos/66a1e4371fed42998b667538/1721886222616.mp4", mediaType: 1, date: Int64(1710840584796.0), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "65f95b083293a603e0140baa", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
    ] */
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        switch IVSReelsUtility.selectedReelsCategory {
        case .following:
            return homeFeeds.isEmpty ? popularUser.map { $0 as! ListDiffable } : homeFeeds
        case .trending:
            return reels.isEmpty ? cachedReels : reels
        case .exclusive:
            return exclusiveReels.isEmpty ? [] : exclusiveReels
        }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is ISMReels:
            let controller = ISMReelsSectionController()
            controller.displayDelegate = self
            return controller
        case is ISMPopularUser :
            return ISMFollowingSectionController()
        default:
            return ListSectionController()
        }
        
    }
  
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    func homeFeedsIsEmpty() -> Bool {
        return homeFeeds.isEmpty
    }
    
    func updateFeeds(reels : [ISMReels]){
        DispatchQueue.main.async {
            self.reels = reels
    //        print(reels)
            CacheManager.shared.clearCachedReels()  // Clear old cache
            CacheManager.shared.saveCachedReels(reels) // Save new reels
        }
    }
    func updateExclusiveFeeds(reels : [ISMReels]){
        DispatchQueue.main.async {
            self.exclusiveReels = reels
            //        print(reels)
        }
    }
    
    func updateHomeFeeds(reels : [ISMReels]){
        DispatchQueue.main.async {
            self.homeFeeds = reels
            //        print(reels)
        }
    }
    
    
    func updatePopularUser(popularUser: [ISMPopularUserContent]) {
        
        let popularUserSection = ISMPopularUser(identifier: "popularUsers", data: popularUser)
        self.popularUser.append(popularUserSection)
//        data.append(popularUserSection)
    }
    
    func deleteData(postid : String) {
        switch IVSReelsUtility.selectedReelsCategory {
        case .following:
            homeFeeds.removeAll { reel in
                reel.postId == postid
            }
        case .trending:
            reels.removeAll { reel in
                reel.postId == postid
            }
        case .exclusive:
            exclusiveReels.removeAll { reel in
                reel.postId == postid
            }
        }
        CacheManager.shared.clearCachedReels()
    }
    
}

extension ISMReelsDataSource : ListDisplayDelegate{
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController) {
        
        switch sectionController {
            case is ISMReelsSectionController:
            let sectionIndex = listAdapter.section(for: sectionController)
            
            if let adsAllowed = IVSKit.shared.configuration?.adsAllowed, adsAllowed, let count = IVSKit.shared.configuration?.countForAds, count > 0, (sectionIndex != 0 && sectionIndex % count == 0) {
                IVSReelsUtility.postPresentAds()
            }
            
            switch IVSReelsUtility.selectedReelsCategory {
            case .following:
                if !IVSReelsUtility.showPopularUsers {
                    // Get the section index instead of the cell index
                    let totalSections = self.homeFeeds.count
                    // print("Before : \(self.reels.count)")
                    // Trigger pagination when we're at the third-to-last section
                    if sectionIndex == totalSections - 3 && self.viewModel.homeIsFetchMore {
                        print("Paginating with offset = \(self.viewModel.homeOffset ) and limit = \(self.viewModel.homeLimit)")
                        self.viewModel.fetchHomeContent(offset: self.viewModel.homeOffset + self.viewModel.homeLimit) { [weak self] in
                            IVSReelsUtility.postStopVideoPlayback()
                            guard let self = self else { return }
                            self.updateHomeFeeds(reels: self.viewModel.homeReels)
                            listAdapter.performUpdates(animated: false)
                            //                    print("After : \(self.reels.count)")
                        } failure: {error in
                            print(error)
                        }
                    }
                }else {
                    // no pagination added for popular users
                }
                    
                
            case .trending:
                // Get the section index instead of the cell index
                let totalSections = self.reels.count
                // print("Before : \(self.reels.count)")
                // Trigger pagination when we're at the third-to-last section
                if sectionIndex == totalSections - 3 && self.viewModel.isFetchMore {
                    IVSReelsUtility.postStopVideoPlayback()
                    print("Paginating with offset = \(self.viewModel.offset ) and limit = \(self.viewModel.limit)")
                    self.viewModel.fetchReelsContent(offset: self.viewModel.offset + self.viewModel.limit) { [weak self] in
                        guard let self = self else { return }
                        self.updateFeeds(reels: self.viewModel.reels)
                        listAdapter.performUpdates(animated: false)
    //                    print("After : \(self.reels.count)")
                    } failure: { error in
                        print(error)
                    }
                    
                }
            case .exclusive:
                // Get the section index instead of the cell index
                let totalSections = self.exclusiveReels.count
                // print("Before : \(self.reels.count)")
                // Trigger pagination when we're at the third-to-last section
                if sectionIndex == totalSections - 3 && self.viewModel.exclusiveIsFetchMore {
                    print("Paginating with offset = \(self.viewModel.exclusiveOffset ) and limit = \(self.viewModel.exclusiveLimit)")
                    self.viewModel.fetchExclusiveContent(offset: self.viewModel.exclusiveOffset + self.viewModel.exclusiveLimit) { [weak self] in
                        IVSReelsUtility.postStopVideoPlayback()
                        guard let self = self else { return }
                        self.updateExclusiveFeeds(reels: self.viewModel.exclusiveReels)
                        listAdapter.performUpdates(animated: false)
    //                    print("After : \(self.reels.count)")
                    } failure: { error in
                        print(error)
                    }
                }
            }
        default:
            IVSReelsUtility.postStopVideoPlayback()
            break
        }
       
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController) {
        //
    }
    
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
        //
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
        //
    }
    
}
