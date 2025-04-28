//
//  ViewController.swift
//  DemoIVSKit
//
//  Created by 3embed on 28/03/25.
//

import UIKit
import Isometrik_Video_Reels

class ViewController: UIViewController {
    let token = "Bearer eyJhbGciOiJSU0EtT0FFUCIsImN0eSI6IkpXVCIsImVuYyI6IkExMjhHQ00iLCJ0eXAiOiJKV1QifQ.adhRsyssyQhvDaOauVX7ictTU89DfRH2xUoDpXNHVV-xq5S7ZzRmTjnIxsbs7eIQz7S_CD9shZXv62MV3mgOls3wjYYe6pCMilotihv9pTMt_rXn38bmkb3O14G6-RLYcKZayL1WVgLb2TwpO6axCCk5oSorrIFLaGTU-SuEDdM.nyzfAZsdkFY5eCKO.RP7Vyi0CnVqHS8JSayq1xJaSNDz0KC5OsnWxtnzwIyIK_kpVxh4HAOXHTEHe0EtyN_gI-AJ_oWGU2aALf9Rzg_8LaIaMV9bbJ-wKCMmokfGs--Bns4mI_8ZNjTvigy2POvstKWhXuxnlIl_FipH1sms9GjealgJ6TgffGNhlYJu4kE39NcjUrM1YEt1BQqDN3qte74jrEDDh6mjoacEi5VsOYhIxX4R_IZPvCrjhnWKd9OlJjwaN8Qf1gDWDJoJmI2pmtNRYQG5uvfpQ95mNOUinD0_0XcldIGdzsIPj6KBmBUIbQVpiRIlYsI3Rj6fEXeSjNnGh6tXPwe0TJyiAlm2oGbUwtTJdgl6rbBtp_4Y0ubwlZrLZPy0Pqqo6TVA2K8mAxDf2l9RhZ8dGrqmKZl-ASPpDLbd5r0eQKwm_q_KyhFQdMO-KGQ5MVhXr49POWebW9mVr9uPrGR-KQ7MSkREfV25aUdr9KGs607uGmEhTmG9Cf2jq3cQeDLC0kXWAjWODBK01VMQYvL2UM_65RJxWAUljBWnjnExjLWiA-UfTGmWcGfSa9hFij1IdP7qHxzdzBMpKLzVH7ZB_Qxws_xReNObMDh83AQTD4y92Qkkb0wMrOU-VLZkMmv8MR1Pext1hWF2aNQ_twPwZgmBuOcs1W8FbmemKYMPzYkqs2NrVkJ_yAz0nSrJ8I-VGeqsYFiFEBOCV3kxbqX_UafiaBorfYekFOE5RcoCZdSoCiIeA0TO0QR2x7DAnjL7iW1dL3pzbIbKJE0k6sAE38PQF6dbZUJWpTE_ZgKUt9YAsiAbrIoNNEDI8W-oy1V_8SGUTizpaZ1DHxDpALuIu2cra8bQ5X7UF_Fb4iDOFePG-R0B0OKoLrIvAnYujj0bEiAQYzz1QKHMNKgnAMC6A2LQRTR9ok238m2sU1DVOvq62y2q0iHHQpMxpGzXqq6PKeUGcCo1IBanGInVVDKzXZt8WjFs6FdDB7cNpyYiy0McBLavlUfFYRb-4CDIh9p7tGURrR0-2oto70Hgv5L49vggLDAiKlL8ZAIxrB8-R0Wn9SHcDVeTB4uocnZaJFbP2V5M9AHpS8jH75jHRym6vJr0uTe3qkhAEf_d0KWwQTqfgZo2vqaOIGDFvvgBibyx920Zp6eevRFn8XqEK8VQHTTPGDoX3D2R_jRb6bftjtlZ7m6NiFMvHSiuyG2jy9g.5eax07B4ywoaprOANQkgLQ"
    let userId = "66b5e9539701113b4ee78d94"
    let username = "tastee"
    
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
