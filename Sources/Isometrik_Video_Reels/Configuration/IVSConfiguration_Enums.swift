//
//  IVSConfiguration_Enums.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 21/01/25.
//

import Foundation

/// Available content display modes in ISMKit
public enum IVSContentType {
    case reels
    case feeds
    case twitter
}

/// ISMKit environment options
public enum IVSEnvironment {
    case development
    case staging
    case production
}

// MARK: - Error Handling

public enum IVSError: Error {
    case notInitialized
    case invalidConfiguration
    case presentationDelegateNotSet
    case presentationFailed
    case networkError(String)
    case unknown(String)
}
