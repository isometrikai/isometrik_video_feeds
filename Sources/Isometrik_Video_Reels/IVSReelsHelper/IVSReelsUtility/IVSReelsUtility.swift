//
//  ISMReelsUtility.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 27/12/24.
//

import Foundation
import UIKit

class IVSReelsUtility {
    static var selectedReelsCategory : IVSReelsCategory = .trending
    static var scrollOffsets: [IVSReelsCategory: CGPoint] = [:]
    static var showPopularUsers : Bool = false
    static var isMute : Bool = false
    //MARK: - Functions
    /// post stopping of video on reels
    static func postStopVideoPlayback() {
        NotificationCenter.default.post(name: .stopVideoPlayback , object: nil)
    }
    static func postPlayVideoPlayback() {
        NotificationCenter.default.post(name: .playVideoPlayback , object: nil)
    }
    static func postScrollToNextVideo() {
        NotificationCenter.default.post(name: .scrollToNextVideo , object: nil)
    }
  
    static func postOpenLoginScreen() {
        NotificationCenter.default.post(name: .openLoginScreen , object: nil)
    }
    
    static func postManageLikeAndUnlikeUsers(isliked : Bool ,userId : String , postId : String) {
        let userInfo: [String: Any] = [
            "userId": userId,
            "postId": postId,
            "isliked" : isliked
        ]
        NotificationCenter.default.post(name: .manageLikeAndUnlikePosts , object: nil,userInfo: userInfo)
    }
    
    
    static func postOpenCommentsView(commentsAllowed : Bool,commentsCount : Int , viewsCount : Int , likesCount : Int , isPurchased : Bool , isPaid : Bool , postId : String , userId : String , isLikesSelected : Bool = false) {
        
        let userInfo: [String: Any] = [
            "postID": postId,
            "commentsAllowed": commentsAllowed,
            "commentsCount": commentsCount,
            "viewsCount" : viewsCount,
            "likesCount" : likesCount,
            "isPurchased" : isPurchased,
            "isPaid" : isPaid,
            "userId" : userId,
            "isLikesSelected" : isLikesSelected,
        ]
 
        NotificationCenter.default.post(name: .openCommentsView , object: nil , userInfo: userInfo)
    }
    static func postOpenTipViewController(postID : String ,postUserName : String , postUserID : String , isPurchased : Bool , isPaid : Bool) {
        let userInfo: [String: Any] = [
               "postID": postID,
               "postUserName": postUserName,
               "postUserID": postUserID,
               "isPaid" : isPaid,
               "isPurchased" : isPurchased
           ]
        NotificationCenter.default.post(name: .openSendTipView , object: nil , userInfo: userInfo)
    }
    
    static func postOpenShareViewController(postID : String ,postUserName : String , postUserID : String , isPurchased : Bool , isPaid : Bool,thumbnailUrl : String, imageUrl : String,postTitle : String , mediaType : Int) {
        let userInfo: [String: Any] = [
               "postID": postID,
               "postUserName": postUserName,
               "postUserID": postUserID,
               "isPaid" : isPaid,
               "isPurchased" : isPurchased,
               "thumbnailUrl" : thumbnailUrl,
               "imageUrl" : imageUrl,
               "postTitle" : postTitle,
               "mediaType" : mediaType
           ]
        NotificationCenter.default.post(name: .openShareView , object: nil , userInfo: userInfo)
    }

    static func postOpenMediaOptionsView( data : IVSInterfaceMedia) {
        let userInfo : [String : IVSInterfaceMedia] = ["data" : data]
        NotificationCenter.default.post(name: .openMoreView, object: nil, userInfo: userInfo)
    }
    
    static func postOpenLockedPost( data : IVSInterfaceMedia) {
        let userInfo : [String : IVSInterfaceMedia] = ["data" : data]
        NotificationCenter.default.post(name: .unlockPost, object: nil, userInfo: userInfo)
    }
    
    static func postSubscribePost( data : IVSInterfaceMedia) {
        let userInfo : [String : IVSInterfaceMedia] = ["data" : data]
        NotificationCenter.default.post(name: .subscribePost, object: nil, userInfo: userInfo)
    }
    
    
    static func reloadData() {
        NotificationCenter.default.post(name: .reloadData , object: nil)
    }
    
    
    static func followAndUnfollowUser(isfollowed : Bool ,userID : String) {
            let userInfo: [String: Any] = [
                "followingId": userID,
                "isfollowed" : isfollowed
            ]
            NotificationCenter.default.post(name: .followAndUnfollowUser , object: nil,userInfo: userInfo)
    }

    static func postOpenMusicView(isPurchased : Bool , data : IVSMediaData) {
        let userInfo : [String : Any] = [
            "isPurchased" : isPurchased,
            "data" : data
        ]
        
        NotificationCenter.default.post(name: .openMusicView, object: nil , userInfo: userInfo)
    }
    
    
    static func postOpenBottomProfileView(postUserName : String , postUserID : String) {
        let userInfo: [String: Any] = [
               "postUserName": postUserName,
               "postUserID": postUserID,
           ]
        NotificationCenter.default.post(name: .openBottomProfileView , object: nil , userInfo: userInfo)
    }
    
    static func postOpenViewersView(postID : String) {
        let userInfo: [String: Any] = [
               "postID" : postID
           ]
        NotificationCenter.default.post(name: .openViewersView , object: nil , userInfo: userInfo)
    }
    
    static func setImageFromUrl(mediaUrl: String, imageView: UIImageView) {
        var finalUrl = mediaUrl
        if !mediaUrl.contains("https://"){
            finalUrl = mediaUrl.replacingOccurrences(of: "http://", with: "https://")
        }
        
        // Check if the image is in the cache
        if let cachedImage = ImageCacheManager.shared.getImage(forKey: finalUrl) {
            imageView.image = cachedImage
            return
        }
        
        
        guard let url = URL(string: finalUrl) else {
            print("Invalid URL: \(finalUrl)")
            return
        }
        // Create a URLSession data task to download the image
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors or invalid data
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response from server")
                return
            }

            guard let data = data, let downloadedImage = UIImage(data: data) else {
                print("Error converting data to UIImage")
                return
            }
            // Cache the downloaded image
            ImageCacheManager.shared.setImage(downloadedImage, forKey: finalUrl)
            
            // Set the image on the main thread
            DispatchQueue.main.async {
                imageView.image = downloadedImage
            }
        }.resume()
    }
    
    static func setImageFromUrlForButton(mediaUrl: String, button: UIButton, placeholder: UIImage?) {
        var finalUrl = mediaUrl
        if !finalUrl.contains("https://") {
            finalUrl = finalUrl.replacingOccurrences(of: "http://", with: "https://")
        }
        
        // Set placeholder immediately
        DispatchQueue.main.async {
            button.setImage(placeholder, for: .normal)
        }
        
        // Check if the image is cached
        if let cachedImage = ImageCacheManager.shared.getImage(forKey: finalUrl) {
            DispatchQueue.main.async {
                button.setImage(cachedImage, for: .normal)
            }
            return
        }
        
        guard let url = URL(string: finalUrl) else { return }

        // Fetch image asynchronously
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let data = data, let downloadedImage = UIImage(data: data) else {
                return
            }

            // Cache the downloaded image
            ImageCacheManager.shared.setImage(downloadedImage, forKey: finalUrl)

            // Ensure the correct image is set (avoid overwriting due to cell reuse)
            DispatchQueue.main.async {
                if button.currentImage == placeholder {
                    button.setImage(downloadedImage, for: .normal)
                }
            }
        }.resume()
    }

//    static func timeAgo(from dateString: String) -> String {
//        // Define the input date format
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
//        dateFormatter.timeZone = TimeZone.current
//        
//        // Convert string to Date
//        guard let date = dateFormatter.date(from: dateString) else {
//            return "Invalid date"
//        }
//        
//        // Calculate the time difference
//        let calendar = Calendar.current
//        let now = Date()
//        let components = calendar.dateComponents([.year, .month, .day], from: date, to: now)
//        
//        // Determine the relative time
//        if let year = components.year, year > 0 {
//            return year == 1 ? "1 year ago" : "\(year) years ago"
//        } else if let month = components.month, month > 0 {
//            return month == 1 ? "1 month ago" : "\(month) months ago"
//        } else if let day = components.day, day > 0 {
//            return day == 1 ? "1 day ago" : "\(day) days ago"
//        } else {
//            return "Today"
//        }
//    }
 

    static func getCachedInitialsImage(username: String) -> UIImage {
        let cacheKey = "initials_\(username)"

        if let cachedImage = ImageCacheManager.shared.getImage(forKey: cacheKey) {
            return cachedImage
        }

        let initialsImage = createInitialsImage(from: username)
        ImageCacheManager.shared.setImage(initialsImage, forKey: cacheKey)

        return initialsImage
    }

    static func createInitialsImage(from username: String) -> UIImage {
          let initials = getInitials(from: username)
          let size = CGSize(width: 100, height: 100) // Adjust as needed
          let renderer = UIGraphicsImageRenderer(size: size)

          return renderer.image { context in
              let backgroundColor = UIColor(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1), alpha: 1.0) // Change color as needed
              backgroundColor.setFill()
              context.fill(CGRect(origin: .zero, size: size))

              let attributes: [NSAttributedString.Key: Any] = [
                  .foregroundColor: UIColor.white,
                  .font: UIFont.boldSystemFont(ofSize: 40) // Adjust font size
              ]

              let textSize = initials.size(withAttributes: attributes)
              let textRect = CGRect(
                  x: (size.width - textSize.width) / 2,
                  y: (size.height - textSize.height) / 2,
                  width: textSize.width,
                  height: textSize.height
              )
              
              initials.draw(in: textRect, withAttributes: attributes)
          }
      }
      
      static func getInitials(from name: String) -> String {
          let words = name.components(separatedBy: " ")
          let firstLetter = words.first?.prefix(1) ?? ""
          let secondLetter = words.count > 1 ? words[1].prefix(1) : words.first?.suffix(1) ?? ""
          return (firstLetter + secondLetter).uppercased()
      }
    
    
    
   static func timeAgo(from timestamp: Int64) -> String {
        let currentTime = Date().timeIntervalSince1970
        let timestampSeconds = Double(timestamp) / 1000.0
        let timeDiff = currentTime - timestampSeconds

        let secondsInMinute = 60.0
        let secondsInHour = 60 * secondsInMinute
        let secondsInDay = 24 * secondsInHour
        let secondsInMonth = 30 * secondsInDay
        let secondsInYear = 12 * secondsInMonth

        if timeDiff >= secondsInYear {
            return "\(Int(timeDiff / secondsInYear)) years ago"
        } else if timeDiff >= secondsInMonth {
            return "\(Int(timeDiff / secondsInMonth)) months ago"
        } else if timeDiff >= secondsInDay {
            return "\(Int(timeDiff / secondsInDay)) days ago"
        } else if timeDiff >= secondsInHour {
            return "\(Int(timeDiff / secondsInHour)) hours ago"
        } else if timeDiff >= secondsInMinute {
            return "\(Int(timeDiff / secondsInMinute)) minutes ago"
        } else {
            return "Just now"
        }
    }


    
    
}
