//
//  ISMReelsViewModel.swift
//  ISM
//
//  Created by 3embed on 18/12/24.
//

import Foundation

/// Responsible for fetching data for the ISMReels Page
class ISMReelsViewModel{
    /// Stores the posts for Reels Page
    var reels = [ISMReels]()
    
    /// Fetch reels data for reels page
    /// - Parameter success: Notifies if the data has been fetched successfully
    func fetchReelsContent(success : @escaping() -> ()){
        // Convert the JSON string to Data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                // Decode JSON into the PostResponse struct
                let decodedResponse = try JSONDecoder().decode(FeedsPosts.self, from: jsonData)
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
