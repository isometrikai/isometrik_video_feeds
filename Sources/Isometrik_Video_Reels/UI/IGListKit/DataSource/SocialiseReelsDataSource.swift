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
    var cachedReels : [ISMReels] =
     [
        .init(name: "reel_01", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/69146193c9c41aedf3070fb3/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 1), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_01", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_02", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691468db9152d1a63ff08caf/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 2), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_02", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_03", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/690da5929fe0c40fc853f03e/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 3), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_03", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_04", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6932ca4f7d19d070280f1ca5/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 4), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_04", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_05", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6932ca4f7d19d070280f1cbb/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 5), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_05", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_06", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691463ff7955651226281cd8/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 6), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_06", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_07", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/693668d403bcee22ddf30523/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 7), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_07", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_08", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691313bcf1eaa49a649b692b/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 8), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_08", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_09", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6933235a7d19d0702817031a/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 9), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_09", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_10", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6913332ec9c41aedf3f6a6d9/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 10), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_10", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_11", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691336859152d1a63fdfdd60/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 11), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_11", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_12", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/69145dc3c9c41aedf306d058/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 12), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_12", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_13", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6914683dc9c41aedf3077ec1/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 13), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_13", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_14", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/69146133795565122627f0ae/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 14), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_14", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_15", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691427099152d1a63fec4403/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 15), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_15", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_16", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/68cd5da02b33c1c85758dbd7/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 16), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_16", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_17", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6948d7b579e0b4a2d62b9c97/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 17), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_17", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_18", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691467319152d1a63ff06fb5/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 18), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_18", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_19", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/690da22d22dd679fa2fe1365/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 19), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_19", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_20", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691439af9152d1a63fed697a/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 20), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_20", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_21", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/68d2c84204980dd753f6d1ce/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 21), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_21", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_22", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/68ef3fdd85d14eb3e3310773/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 22), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_22", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_23", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6914693cc9c41aedf307906f/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 23), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_23", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_24", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/69142b1b79556512262462ae/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 24), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_24", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_25", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/691465fa7955651226283f90/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 25), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_25", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_26", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6914322e9152d1a63fecef5e/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 26), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_26", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_27", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/68d6743a29d13fb683d1d4ed/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 27), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_27", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_28", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/68d6734f028ee75622046b5a/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 28), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_28", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_29", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/6914c8b2c9c41aedf30e792e/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 29), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_29", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_30", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/69409884616d7c8c6a5fac0c/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 30), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_30", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
        .init(name: "reel_31", imageUrl: "https://video.gumlet.io/6890598d69cc5f5f003fdf04/694257bc616d7c8c6a8a5d0b/main.m3u8", mediaType: 1, date: Int64(1710840584796.0 + 31), otherUserProfileImageUrl: "https://dubly.gumlet.io/dubly/images/65f9325a3293a6d353140b2e/1710840582067.jpeg", caption: "", isStar: false, allowComments: true, isfollow: false, musicData: nil, subscriptonAmount: 0, likesCount: 10, commentsCount: 10, viewsCount: 10, userId: "65f9325a3293a6d353140b2e", isPurchased: true, postAmount: 0, postId: "post_31", liked: true, isBookMarked: false, profilePic: "https://dubly.gumlet.io/dubly/profile_images/66a1e4371fed42998b667538/1721887482118.jpeg", allowDownload: true, imageUrlWidth: "100"),
    ]
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        switch IVSReelsUtility.selectedReelsCategory {
        case .following:
            return homeFeeds.isEmpty ? popularUser.map { $0 as! ListDiffable } : homeFeeds
        case .trending:
            return cachedReels //reels.isEmpty ? cachedReels : reels
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
            
            if let count = IVSKit.shared.configuration?.countForAds, count > 0, (sectionIndex != 0 && sectionIndex % count == 0) {
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

