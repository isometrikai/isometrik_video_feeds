//
//  ISMEnums.swift
//  Hold necessary informations regarding various categories on ISMReels view
//
//  Created by 3embed on 19/12/24.
//

import Foundation

/// Shows side bar socila buttons present on the reels page
enum ISMReelsSocialButtons : CaseIterable{
    case mute
    case like
    case views
    case comment
    case share
    case more
}

enum ISMReelsMediaType : Int{
    case image = 0
    case video = 1
}
