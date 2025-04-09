//
//  ViewController.swift
//  DemoIVSKit
//
//  Created by 3embed on 28/03/25.
//

import UIKit
import Isometrik_Video_Reels

class ViewController: UIViewController {
    let token = "Bearer eyJhbGciOiJSU0EtT0FFUCIsImN0eSI6IkpXVCIsImVuYyI6IkExMjhHQ00iLCJ0eXAiOiJKV1QifQ.e3tzN4ScJ_yQ2leVP4JC3sGHLYgoNdL4yWSQg8qb7epaScpgZOQrqYdBrvQN6PDRiDJrnuH5ls5IzUWbNrZZvX2I6vwlfyqN8NQYBPKNZzP8pkUCTQFrIVwBLFwPHjsDPwbGcC3AxWEHpxA2oIR-ANff5Tk7Xr-Q6ySPSrE-0VI.r3BV-ymgkwZgsX8J.GYqVoNpq5vbTrNgnFwM-BhB5Ur-sRh7bmlvouUpxFtB6lVm8OSJ5JjZbrUbudDql-AXkzIV3bk8ReEaO5dsqh_5ay-ArJ7q0FPRUdyw9kUBGTavzLqT7QjVwNdj3795KeYjD9JjdD7x5u8jXnLHYv0Ij7YxwSoZz9_vGy_f5bqrFMthhwvBHc_Lvx5g-YtXC8cvFFyicsqnqMjAxwozqLp7IrzbxY8phNj5rujx5GLykKmfJATwrzMEw8QoE82O-KqEQq6uj_SnFyjNP-hK6CZyMod4lMkip5u_mqFE0qrFIydoJnTkqExlSqlPPG6XatD9LgQs5HUvfT1GjkHA49YBbE2bs_a3g9Tu5xAQaq1xE34Lb_H80pLA2Y_Tt9US_-LovC0BhDpDsxqvuvc4RtbJ4Ao2SxXCE4NlnoiqAIK6GUZhOkv2V4MLOk0UkNJgPWwOXOwM6-UrDJw2Z8ZaroXhg85ksuYgVEJCqy1WxXBrxUYBr8bkhIXRZo2K4DaxGQX6eWt2NelJIvc03vyFu_FdXfA0emZTcT0B0G728Qo7_PWNecXiVoXRVPN302kaTdTocUoyvLAddAQ7cRv7nmMlgxErs_6XkNsS9QNEIykyA2itVC7nF4zjjHp39lT_7q47P5DEmexrjybwd4zuJAGcHeVQnmCfpeQeF9VDqFwTChuXkVmRVr8C3p7FvBh2J51PnFOHAlhcK39gOKsL-twejHXIfLUGE5tAtZWHp2xVDhlW2uD_X-1JNG_N4u1Q7qKs7Iku3ndpqNyI6_0TRhEuLbGn8V6Y5Eio2ctnSE0KTkRIgIrMYsvvz3ces_nBlzn7x0tmeUPJQEPxEvOAh4hwU9fZeLL37VpqlZyhNoyW0ZzBusWkz8mF1uG9uOqAReNPRJEwrWWoCFMvY34VxGrNs4N6m6RtCt_uEO92NLzKyqhy9Arq-kTHwi3OlF8QTxHgPXx2hcGtaSwaGW5brp9Iadv8kq3qEqRbBc1ZihM_lemz5gMSatDgMMn1M05giX1bFXYjPckwA0bA6SDGtD2pNnIFhLHMUIpbllWiZOrWPRmExuONNSIOMg5mC1mfhWB-UmTcVF2iSfSn6m-AkkRUNRWlKCn5D4BsuUjsm_GHgK08ly9NLMUwJCDWbWiRBGUjbGhIOo4F3Hsb7s_zeI-0DM5SMhdK94H3fE27bEhnJOEY6D931yg7L7w.D5EQamY-uxFFBRImgXtJow"
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
