//
//  ISMConfiguartion.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 02/01/25.
//

import Foundation
import UIKit

public protocol ISMPresentationDelegate: AnyObject {
    /// Called when SDK needs to present content
    func present(viewController: UIViewController)
    /// Called when SDK needs to dismiss content
    func dismiss()
}

/// Available content display modes in ISMKit
public enum ISMContentType {
    case reels
    case feeds
    case twitter
}

/// ISMKit: Main configuration interface for the Isometrik Social Media SDK
public protocol ISMDelegate: AnyObject {
    /// Called when user wants to view their profile
    func didTapProfile()
    /// Called when user wants to access coin/payment features
    func didTapCoins()
    /// Called when an error occurs within the SDK
    func didEncounterError(_ error: ISMError)
}

/// Configuration options for ISMKit
public struct ISMConfiguration {
    public let apiKey: String
    public let environment: ISMEnvironment
    public let theme: ISMTheme?
    
    public init(apiKey: String,
                environment: ISMEnvironment = .production,
                theme: ISMTheme? = nil) {
        self.apiKey = apiKey
        self.environment = environment
        self.theme = theme
    }
}

/// ISMKit environment options
public enum ISMEnvironment {
    case development
    case staging
    case production
}

// MARK: - Theming

public struct ISMTheme {
    public let primaryColor: UIColor
    public let secondaryColor: UIColor
    public let fontFamily: String?
    
    public init(primaryColor: UIColor = .systemBlue,
                secondaryColor: UIColor = .systemGray,
                fontFamily: String? = nil) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.fontFamily = fontFamily
    }
}
    /// Main entry point for the ISMKit SDK
    public final class ISMKit {
        // MARK: - Properties
        public static let shared = ISMKit()
        
        /// Delegate to handle SDK callbacks
        public weak var delegate: ISMDelegate?
        /// Delegate to handle view controller presentation
        public weak var presentationDelegate: ISMPresentationDelegate?
        
        private var configuration: ISMConfiguration?
        
        private init() {}
        
        // MARK: - Public Methods
        
        public func configure(with configuration: ISMConfiguration,
                              completion: @escaping (Result<Void, ISMError>) -> Void) {
            self.configuration = configuration
            completion(.success(()))
        }
        
        public func show(contentType: ISMContentType,
                         completion: @escaping (Result<Void, ISMError>) -> Void) {
            guard let _ = configuration else {
                completion(.failure(.notInitialized))
                return
            }
            
            guard let presentationDelegate = presentationDelegate else {
                completion(.failure(.presentationDelegateNotSet))
                return
            }
            
            let viewController: UIViewController
            
            switch contentType {
            case .reels:
                viewController = createReelsViewController()
            case .feeds:
                viewController = createFeedsViewController()
            case .twitter:
                viewController = createTwitterViewController()
            }
            
            presentationDelegate.present(viewController: viewController)
            completion(.success(()))
        }
        
        public func terminate() {
            presentationDelegate?.dismiss()
            // Additional cleanup...
        }
    }

    
    // MARK: - Private Implementation
    
    private extension ISMKit {
        func createReelsViewController() -> UIViewController {
            let reelsVC = ISMReelsViewController()
            reelsVC.configDelegate = delegate
            return reelsVC
        }
        
        func createFeedsViewController() -> UIViewController {
            // Implementation...
            return UIViewController()
        }
        
        func createTwitterViewController() -> UIViewController {
            // Implementation...
            return UIViewController()
        }
    }

// MARK: - Error Handling

public enum ISMError: Error {
    case notInitialized
    case invalidConfiguration
    case presentationDelegateNotSet
    case presentationFailed
    case networkError(String)
    case unknown(String)
}
