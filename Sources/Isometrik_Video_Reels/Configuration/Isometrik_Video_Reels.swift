//
//  IVSConfiguartion.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 02/01/25.
//

import Foundation
import UIKit

/// Main entry point for the ISMKit SDK
  public class IVSKit {
    // MARK: - Properties
    public static let shared = IVSKit()
    /// Delegate to handle SDK callbacks
    public weak var delegate: IVSDelegate?
    /// Delegate to handle view controller presentation
    public weak var presentationDelegate: IVSPresentationDelegate?
      
    public var currentContentViewController: UIViewController?
    
    //MARK: - Internal Declarations
    internal var configuration: IVSFeedsConfiguration?
    internal var contentType: IVSContentType = .reels
    
    //MARK: - LifeCycle
    private init() {}
    
    // MARK: - Public Methods
    
    public func configure(with configuration: IVSFeedsConfiguration, completion: @escaping (Result<Void, IVSError>) -> Void) {
        self.configuration = configuration
        setToken()
        
        completion(.success(()))
    }
    
    public func show(contentType: IVSContentType,completion: @escaping (Result<Void, IVSError>) -> Void) {
        guard let _ = configuration else {
            completion(.failure(.notInitialized))
            return
        }
        
        guard let presentationDelegate = presentationDelegate else {
            completion(.failure(.presentationDelegateNotSet))
            return
        }
        self.contentType = contentType
        
        let viewController: UIViewController
        
        switch contentType {
        case .reels:
            viewController = createReelsViewController()
        case .feeds:
            viewController = createFeedsViewController()
        case .twitter:
            viewController = createTwitterViewController()
        }
        
        self.currentContentViewController = viewController 
        presentationDelegate.present(viewController: viewController)
        completion(.success(()))
    }
    
    public func terminate() {
        presentationDelegate?.dismiss()
        // Additional cleanup...
    }
    
      public func stopPlayback() {
        IVSReelsUtility.postStopVideoPlayback()
    }
      public func startPlayback() {
        IVSReelsUtility.postPlayVideoPlayback()
    }
    public func applicationReceiveMemoryWarningAction() {
        ImageCacheManager.shared.clearCache()
        CacheManager.shared.clearCachedReels()
      }
      
      public func didEnterForeground(viewController : UIViewController) {
        if let reelsVC = viewController as? ISMReelsViewController {
            reelsVC.playMostVisibleCellVideo()
        }
    }
    
      public func updateDataForEditPost(for viewController: UIViewController , newPost : IVSEditProfileData) {
        if let reelsVC = viewController as? ISMReelsViewController {
            if let visibleCell = reelsVC.getMostVisibleCell() as? ISMReelsCollectionViewCell {
                visibleCell.bottomView.data.updateDataForEditPost(post: newPost)
                visibleCell.bottomView.captionLabel.text = newPost.caption
            }
        }
    }
    
    /// Handle play and pause logic based on the flow
      public func handlePlayback(for viewController: UIViewController) {
        switch contentType {
        case .reels:
            if let reelsVC = viewController.children.first as? ISMReelsViewController {
                // Get the most visible cell and play its video
                if let visibleCell = reelsVC.getMostVisibleCell() as? ISMReelsCollectionViewCell {
                    // Stop all other videos first
                    IVSReelsUtility.postStopVideoPlayback()
                    // Play video for the most visible cell
                    visibleCell.playVideo()
                }
            } else {
                // If not in reels view controller, stop all videos
                IVSReelsUtility.postStopVideoPlayback()
            }
        case .feeds, .twitter:
            // Handle other flows if needed
            print("\(contentType) playback logic can be implemented here.")
        }
    }
    
      public func updateBookmarkStatus(for viewController: UIViewController , isBookmarked : Bool) {
        switch contentType {
        case .reels:
            if let reelsVC = viewController as? ISMReelsViewController {
                if let visibleCell = reelsVC.getMostVisibleCell() as? ISMReelsCollectionViewCell {
                    visibleCell.socialView.data.updateBookmarkStatus(isBookMarked: isBookmarked)
                }
            }
            
        default :
            print("\(contentType) updates ")
        }
    }
    
    
    
      public func handleCommentsCountUpdation(for viewController: UIViewController , newCount : Int) {
        switch contentType {
        case .reels:
            if let reelsVC = viewController as? ISMReelsViewController {
                if let visibleCell = reelsVC.getMostVisibleCell() as? ISMReelsCollectionViewCell {
                    visibleCell.socialView.data.updatecommentsCount(commentsCount: newCount)
                    visibleCell.socialView.commentsCount.setTitle("\(newCount)", for: .normal)
                }
            }
            case .feeds , .twitter:
                print("\(contentType) updates ")
            
        }
    }
    
      public func updateFollowingData() {
        NotificationCenter.default.post(name: .updateFollowing, object: nil)
    }
    
      public func updateDeletePostData(for viewController: UIViewController , postId : String) {
        if let reelsVC = viewController as? ISMReelsViewController {
            reelsVC.deletePost(postId: postId)
        }
    }
    
    
      public func updateUnlockingPostData(for viewController: UIViewController) {
        if let reelsVC = viewController as? ISMReelsViewController {
            if let visibleCell = reelsVC.getMostVisibleCell() as? ISMReelsCollectionViewCell {
                visibleCell.blurView.updateBlurViewEffect()
                visibleCell.blurView.isHidden = true
                visibleCell.blurView.removeFromSuperview()
                
            }
        }
    }
      
      public func updateWalletValue(for viewController: UIViewController , value: String) {
          IVSKit.shared.configuration?.walletPrice = value
          if let reelsVC = viewController as? ISMReelsViewController {
              if let visibleCell = reelsVC.getMostVisibleCell() as? ISMReelsCollectionViewCell {
                  DispatchQueue.main.async {
                      reelsVC.coinsLabel.text = value
                  }
              }
          }
      }
    
    static func getUserToken() -> String {
        do {
            let data = try KeychainWrapper.get(account: "userToken")
            guard let data, let userToken = String(data: data, encoding: .utf8) else {
                print("User Token is nil. Please set it before calling getUserToken().")
                return ""
            }
            return userToken
        } catch {
            print("Failed to retrieve User Secret: \(error)")
            return ""
        }
    }
    static func getUserId() -> String {
        self.shared.configuration?.userId ?? ""
    }
    static func getUserName() -> String? {
        self.shared.configuration?.username
    }
    static func getIsGuestUser() -> Bool {
        return self.shared.configuration?.isGuestUser ?? false
    }
    static func getBaseUrl() -> String? {
        return self.shared.configuration?.baseUrl
    }
    static func getPopularUserApi() -> String? {
        return self.shared.configuration?.popularApi
    }
    static func getLikesApi() -> String? {
        return self.shared.configuration?.likeApi
    }
    static func getUnLikeApi() -> String? {
        return self.shared.configuration?.unlikeApi
    }
    static func getFollowingApi() -> String? {
        return self.shared.configuration?.followingApi
    }
    static func getExclusiveApi() -> String? {
        return self.shared.configuration?.exclusiveApi
    }
    static func getGuestApi() -> String? {
        return self.shared.configuration?.guestApi
    }
    static func getTrendingApi() -> String? {
        return self.shared.configuration?.trendingApi
    }
    static func getWalletValue() -> String? {
        return self.shared.configuration?.walletPrice
    }

    func getThemeColor() -> UIColor {
        IVSKit.shared.configuration?.theme?.themeColor ?? UIColor(resource: .soAppBase)
    }
    
    func setToken() {
        do {
            guard let data = configuration?.bearerToken.data(using: .utf8) else {
                return
            }
            try KeychainWrapper.set(value: data, account: "userToken")
        }catch{
            //handle error
        }
    }
    
}

