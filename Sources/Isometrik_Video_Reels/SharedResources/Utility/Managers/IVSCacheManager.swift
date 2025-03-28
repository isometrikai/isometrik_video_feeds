//
//  IVSCacheManager.swift
//  PicoAdda
//
//  Created by 3embed on 10/02/25.
//  Copyright © 2025 Rahul Sharma. All rights reserved.
//

import Foundation
import UIKit

class ImageCacheManager {
    static let shared = ImageCacheManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {
        cache.countLimit = 100  // Maximum number of images
        cache.totalCostLimit = 50 * 1024 * 1024  // 50 MB max memory usage
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        let cost = image.pngData()?.count ?? 0  // Estimate memory usage
        cache.setObject(image, forKey: key as NSString, cost: cost)
    }
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func removeImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
    
}

class CacheManager {
    static let shared = CacheManager()
    private let cacheKey = "cachedReels"
    private init() { }
    
    func saveCachedReels(_ reels: [ISMReels]) {
        do {
            let data = try JSONEncoder().encode(reels)
            UserDefaults.standard.set(data, forKey: cacheKey)
        } catch {
            print("Error saving cached reels: \(error)")
        }
    }

    func loadCachedReels() -> [ISMReels] {
        guard let data = UserDefaults.standard.data(forKey: cacheKey) else { return [] }
        do {
            return try JSONDecoder().decode([ISMReels].self, from: data)
        } catch {
            print("Error loading cached reels: \(error)")
            return []
        }
    }
    
    func clearCachedReels() {
        UserDefaults.standard.removeObject(forKey: cacheKey)
        UserDefaults.standard.synchronize()
    }
}

