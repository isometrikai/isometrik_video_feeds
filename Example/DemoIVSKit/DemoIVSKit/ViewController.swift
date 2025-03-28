//
//  ViewController.swift
//  DemoIVSKit
//
//  Created by 3embed on 28/03/25.
//

import UIKit
import Isometrik_Video_Reels

class ViewController: UIViewController {
    let token = "Bearer eyJhbGciOiJSU0EtT0FFUCIsImN0eSI6IkpXVCIsImVuYyI6IkExMjhHQ00iLCJ0eXAiOiJKV1QifQ.SkMZ5E1WGJg8_8ZpW6pHpirjGZnSMo0vU_BvTUFp-NLNVYfdIzVaaUsT5DWXSc7Wqhqw_56xl5UuNJHepmWOYMbHNlwr90SND0Lo9h_QH1ILFK5aNP_HyAUk2MRaCHS3ffdk_Vwb1DRXircII7JYqSp0IbOmN-t5aujYd3q6i2Q.mOQTqP2qXadv6Evv.8UHZ8u-w3ml8Su_YUSkImHPTsT69Nus8ERoWTMaAel2zDu1B24lxtGsICtV_2pfzPaFN8XyMlAJzwlKF2Le-Mi0tnUYVGlvkLEr2tct-6nt6IuqAsHk3ht4uvmX4TdEBqvADAcfxKO3vpRq0FKaeCuQIs3kn8X4JlHXAI891E1Gsvbm4XL0MoEQU3PDT60t05StEj2JVdXBwAJoH6c9nFNc-2B0xVy8ZRh7PAvWPjrZAdsVFGWIWyJhPquo6e3xOkMSDvrJaKO9TuNFR5UtK7VOMt9LuRnoTtZUyFewBMwX_bI-_LttehHssNLTzi4uDfHjsF1VCk7UgKmvXU0U2Hgix09k3z_tAA9zQSvtindiuX5IKDKATNEWGrBPVPAJhy9IL1M68s39UDdyzDqGuWA1QztUywpg7Z_Asz5eAI4qsKEVQIpqerWSi6fUPD43GUtIBWh3UGlmtvNQHBBpArghReleXz4HqixbSUungmGhne6ruY7QaSQ4GQxtlzh1SpRKdnds_Wsldcj6ivG_wFaLvADvekJy4_Mk87u4rBd-3isMnnKm28j9N6Ercz4EKIGBbcTosXI7mDV-l1Od041-gL68-kLSNTgvDnSoQi8yXDPAJ3bYuzhIJXqD1Xk-kQhe8SxOaM-v7DZMxmGjPHk1KiXCAwI6j6Fc90CnenaFNN-lXVqrJkQ9F_an0Xf28kN8TmsvFXhFMxN8ntMWaLOkWE8Qu_UYdb3qzufn_nnF2JrCLAb_fFAhDIr6WM04uoakyyMa1MmH_wFnsw_O3pD8FXxtTR-P_Lw-NEiYbbrP4P9n3zn1kiG1a6eQvTmYOxZBvVoA0uSdlvZGmTHcN-B0kZRUfE3qx32EyoLThb2mEbmt_-SdDdAyCoMBj3TV8alHdlXs5F3FXW3FVVPKExMHZ6LczL_wpHyr8afUB4OmtL7SkCX2qLRnhXQcK-8VHI-VAED2K41NuUUM2lMyKTQ5ZK70uBerUH7kjLh4ONt8l7IMAIkBWvUn6wJfAz--163Oc6q9TMCZzhlXmdvJ89kLKDjhGUBhEs876ttBz89tg8GPPGcay5iKu3vwukFC1XUfEcflXPC8s88l821YpvbbnDMqE2c11MwH8rzJqr80PmYSJ4JLje1KLlWY23UHEaHoZnScpZI6m2GWKGbl4dWNfHOAHXbsmG_FXYbwZ0wiCyKwkU2K-3AehtA.oDyRIryXbgDJu94ddgMrtw"
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
