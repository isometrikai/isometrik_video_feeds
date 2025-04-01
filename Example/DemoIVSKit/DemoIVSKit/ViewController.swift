//
//  ViewController.swift
//  DemoIVSKit
//
//  Created by 3embed on 28/03/25.
//

import UIKit
import Isometrik_Video_Reels

class ViewController: UIViewController {
    let token = "Bearer eyJhbGciOiJSU0EtT0FFUCIsImN0eSI6IkpXVCIsImVuYyI6IkExMjhHQ00iLCJ0eXAiOiJKV1QifQ.I2R8rXrzltfgQ20WcBzrGBHneWbzTtPGNrZyU7_-tRQKELqacs-zsHZp2MnDieSjKOv1uyZmUo2WmtDZz5qvdER7_CSkz4nSPCoPBCmfjKCzAFtXszyXfC71raMAERgl-4a2ncO490K3_ThLjahfy0DN7erogpIpYa67AMJ7Lrc.NhX2I_vhTujaGWhm.QSW6kLU4yBljPnDfRKLlGDXeLCf0i4lpS5cc3m24TtO3Ehc0ca-wZXJ4aZX-fLjSzuVtuAhOP7seir66pdSZRGihPL-tHtOyT-wJ6kAI9Q2GLV2Zp4TQXwJRFrTiMqC5aWzGdjE0ylXlYaNjh-T4GWqBKCI0JiqyEmFj4bWRHIykyXRUFRoVxs5zkSVrxSMy2uBeqswBXQmopJiczhYtUi2FB2DZ4AkGsTkWg1RL_D7TJFBLHejLuAnr0cwiclgYHZO3Lc8RdJ_noUkvc4AyKPRb6qTaVuC55xtOPQtpFKQz6KXXew2nrLoUfsL7O67xgISkatkUxGmlcaayMx-pExJVlixe2Bygt34LH97ugwOKOanuTMXq9byb7OLlcdgGtXt5_Oa70LUX_MfQe8a7rOQ_ZyEiBV1p742ykYl572FkyZFfQ_MR3fyIe_AbAEu8dRtl6NkubNQTd8FyFVgEH5evGXx5JBAASm4hl-wS8OI95jemQ_bC0s-r2RKcK5Y504MwLBcYEKSNeIm-7vQBGO_YqHPRO9-O4Zv0sZYInBFbSCjg0lGXkP68FTSKSXKIoNCG-4ZI-e-FXzu9MQrXxw8svIy06hUKVmIQN3QP-UjB7zRlyG_-vGzMlDS8r3VMQb8ERuNOiodA7Ii7fO-q-lbDpDKUeBrZf4jJjoFn7-bYHMMsT1vFnFP7o0IeI-ivWu8kNxpGQzC-FWiu22qN8D-Huo5qF1NFSXGeeIvwyrNihbVbe_Fj840Tu5JOps294cR3wlMLt34SrOmOVRjUVkt5JafvrnsX6Z_GBpGPdStmloACmPDUxuwW7xGqG9e80gC12Sew0qax78fXezRYEMEgSAPE9D16FBNRuWMV7Nt7KeYl-qu4gm24EApsqhzJzQ5xUjq73oSORYuASdLIS8OKR3vf7FHggTL-9VK5Drbx3G0lpnp4HOO87ICHXCgji1sm7SwGLgX5QhwH5b2ZK171vtlv12VcXXCbdPWiTHrEwz6FiOu5Thf3Fx0aP95LJHwkRC_lnkuaDqOOB9vn4pLjFKYR4h-iqWFy3Du5hBMcsBa7qDYlmJIao_0LxELDGOo3dq_1utwe0b3vUpkDcYJdgxqFjEjwbzzp90iyjOn-kEG3Tk2Rx1MXcwVtbBZa0prfw1WucCw88uIHufqW20uum2KyMo6IMHMH5jAbEiWmzv4bK7Jdqo2YLA.ID_HL_5mqxKyG2nX3oadeg"
    let userId = "67c9c9e8a683a3d10a2643f6"
    let username = "jollyjessica"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        IVSKit.shared.delegate = self
        IVSKit.shared.presentationDelegate = self
        
        let config = IVSFeedsConfiguration(isGuestUser: false, bearerToken: token, walletPrice: "0", userId: userId, username: username)
        IVSKit.shared.configure(with: config) { result in
            //Handle configuration Result
            IVSKit.shared.show(contentType: .reels) { result in
                //Handle result
            }
        }
    }
}

extension ViewController : IVSDelegate {
    func didTapHashtag(withTag: String) {
        //
    }
    
    func didTapMentionedUser(user: String) {
        //
    }
    
    func placeTapped(place: String, placeID: String, latitude: Double, longitude: Double) {
        //
    }
    
    func didTapProfile(postUserId: String, postUserNaame: String?) {
        //
    }
    
    func didTapCoins() {
        //
    }
    
    func didEncounterError(_ error: Isometrik_Video_Reels.IVSError) {
        //
    }
    
    func didFollowUser(userId: String) {
        //
    }
    
    func didUnFollowUser(userId: String) {
        //
    }
    
    func didLikeUser() {
        //
    }
    
    func didUnLikeUser() {
        //
    }
    
    func didTapSocialOptions() {
        //
    }
    
    func didBackButtonTapped() {
        //
    }
    
    func presentLoginScreen() {
        //
    }
    
    func sendTipAction(postID: String, postUserName: String, postUserID: String, isPurchased: Bool, isPaid: Bool) {
        //
    }
    
    func didTapComments(commentsAllowed: Bool, commentsCount: Int, viewsCount: Int, likesCount: Int, isPurchased: Bool, isPaid: Bool, postId: String, userId: String, islikesSelected: Bool) {
        //
    }
    
    func didTapShareView(postUsername: String, userId: String, isPurchased: Bool, isPaid: Bool, postId: String, thumbnailUrl: String, imageUrl: String, postTitle: String, mediaType: Int) {
        //
    }
    
    func didTapViewerView(postId: String) {
        //
    }
    
    func didTapMoreView(data: Isometrik_Video_Reels.IVSInterfaceMedia) {
        //
    }
    
    func didTapMuicButton(isPurchased: Bool, data: Isometrik_Video_Reels.IVSMediaData) {
        //
    }
    
    func didTapfindUserButton() {
        //
    }
    
    func didTapfollowUserFromFollowing(userId: String, followStatus: Int) {
        //
    }
    
    func didTapUnlockPost(data: Isometrik_Video_Reels.IVSInterfaceMedia) {
        //
    }
    
    func didTapSubscribePost(data: Isometrik_Video_Reels.IVSInterfaceMedia) {
        //
    }
    
    func logOutSDK() {
        //
    }
    
    
}

extension ViewController : IVSPresentationDelegate {
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
