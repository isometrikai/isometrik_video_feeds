//
//  UIImageView.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 25/12/24.
//

import Foundation
import UIKit

extension UIImageView{
    func defaultImageViewStyle(customContentMode : UIView.ContentMode = .scaleAspectFill){
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = customContentMode
        
    }
}
