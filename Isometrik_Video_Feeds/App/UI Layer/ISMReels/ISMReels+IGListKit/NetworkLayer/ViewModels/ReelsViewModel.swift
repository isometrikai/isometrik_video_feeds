//
//  ReelsViewModel.swift
//  ISM
//
//  Created by 3embed on 18/12/24.
//

import Foundation

class ReelsViewModel{
    var reels = [ISMReels]()
    
    func fetchFeedsContent(success : @escaping() -> ()){
        // Convert the JSON string to Data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                // Decode JSON into the PostResponse struct
                let decodedResponse = try JSONDecoder().decode(FeedsPosts.self, from: jsonData)
                print("Message: \(decodedResponse.mesage ?? "")")
                print("Total Posts: \(decodedResponse.totalPosts ?? 0)")
                
                // Access first post data for demonstration
                if let firstPost = decodedResponse.data?.first {
                    print("First Post Title: \(firstPost.title ?? "")")
                    print("Image URL: \(firstPost.imageUrl1 ?? "")")
                    print("Music Name: \(firstPost.musicData?.name ?? "")")
                }
                for values in decodedResponse.data!{
                    reels.append(ISMReels(name: values.firstName ?? "",
                                          ImageUrl: values.imageUrl1 ?? "",
                                          mediaType: values.mediaType1 ?? 0))
                }
                
                success()
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
    }
}
