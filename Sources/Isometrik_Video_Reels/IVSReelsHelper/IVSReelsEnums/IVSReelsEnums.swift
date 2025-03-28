//
//  ISMEnums.swift
//  Hold necessary informations regarding various categories on ISMReels view
//
//  Created by 3embed on 19/12/24.
//

import Foundation

/// Shows side bar socila buttons present on the reels page
enum IVSReelsSocialButtons : CaseIterable{
    case mute
    case like
    case views
    case comment
    case share
    case more
}

enum IVSReelsMediaType : Int{
    case image = 0
    case video = 1
}

enum IVSMediaOptions{
    case bookmark
    case share
    case download
    case copyLink
    case record
    case report
}

enum IVSReelsCategory {
    case following
    case trending
    case exclusive
}
