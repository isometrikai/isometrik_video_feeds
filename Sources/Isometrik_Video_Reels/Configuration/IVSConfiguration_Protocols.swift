//
//  IVSConfiguration_Protocols.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 21/01/25.
//

import Foundation
import UIKit

public protocol IVSPresentationDelegate: AnyObject {
    /// Called when SDK needs to present content
    func present(viewController: UIViewController)
    /// Called when SDK needs to dismiss content
    func dismiss()
}


/// ISMKit: Main configuration interface for the Isometrik Social Media SDK
public protocol IVSDelegate: AnyObject {
    /// Called when user wants to view their profile
    func didTapProfile(postUserId : String , postUserNaame : String?)
    /// Called when user wants to access coin/payment features
    func didTapCoins()
    /// Called when an error occurs within the SDK
    func didEncounterError(_ error: IVSError)
    /// Called when you want to follow user
    func didFollowUser(userId : String)
    /// Called when you want to unfollow user
    func didUnFollowUser(userId : String)
    /// Called when you want to like user
    func didLikeUser()
    /// Called when you want to unlike user
    func didUnLikeUser()
    /// Called when you want to open either create Post or go live pop up VC
    func didTapSocialOptions()
    /// Back Button tapped
    func didBackButtonTapped()
    ///Present Login Screen
    func presentLoginScreen()
    ///send Tip Button action
    func sendTipAction(postID : String ,postUserName : String , postUserID : String , isPurchased : Bool , isPaid : Bool)
    ///comments tapped from side bar view
    func didTapComments(commentsAllowed : Bool,commentsCount : Int , viewsCount : Int , likesCount : Int , isPurchased : Bool , isPaid : Bool , postId : String , userId : String,islikesSelected : Bool)
    ///Share View tapped
    func didTapShareView(postUsername : String,userId : String,isPurchased : Bool , isPaid : Bool , postId : String , thumbnailUrl : String , imageUrl : String , postTitle : String , mediaType : Int)
    ///Viwers Count Tapped
    func didTapViewerView(postId : String)
    ///open ,ore view from sidebar
    func didTapMoreView(data : IVSInterfaceMedia)
    ///func musicView Tapped
    func didTapMuicButton(isPurchased : Bool , data : IVSMediaData)
    ///func  called then find people to follow button tapped
    func didTapfindUserButton()
    // follow user button tapped on following screen
    func didTapfollowUserFromFollowing(userId : String , followStatus : Int)
    func didTapUnlockPost(data : IVSInterfaceMedia)
    func didTapSubscribePost(data : IVSInterfaceMedia)
    func logOutSDK()
}
