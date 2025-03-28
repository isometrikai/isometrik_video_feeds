//
//  IVSFontsManager.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 29/01/25.
//

import Foundation
import UIKit

class IVSFontsManager {
    
    static let shared = IVSFontsManager()
    
    private init() {}
    
    private var fontFamilyName: String = "System" // Default to system font
    
    /// Set custom font family
    func setFontFamily(_ familyName: String) {
        fontFamilyName = familyName
    }
    
    /// Retrieve fonts based on weight and size
    func font(for type: FontType, size: CGFloat) -> UIFont {
        let weight = type.fontWeight()
        
        if fontFamilyName == "System" {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        
        let fontName = getFontName(for: weight)
        return UIFont(name: "Helvitica", size: size ) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    /// Get the correct font name based on weight
    private func getFontName(for weight: UIFont.Weight) -> String {
        switch weight {
        case .bold:
            return "\(fontFamilyName)-Bold"
        case .semibold:
            return "\(fontFamilyName)-SemiBold"
        case .medium:
            return "\(fontFamilyName)-Medium"
        case .light:
            return "\(fontFamilyName)-Light"
        default:
            return "\(fontFamilyName)-Regular"
        }
    }
    
    /// Enum to define font types
    enum FontType {
        case body, title, subtitle, caption
        
        func fontWeight() -> UIFont.Weight {
            switch self {
            case .body: return .regular
            case .title: return .bold
            case .subtitle: return .semibold
            case .caption: return .light
            }
        }
    }
    
    
}
