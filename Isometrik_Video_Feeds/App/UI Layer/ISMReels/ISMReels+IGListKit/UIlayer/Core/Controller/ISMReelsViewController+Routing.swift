//
//  ISMReelsViewController+Routing.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 25/12/24.
//

import Foundation

extension ISMReelsViewController {
    // MARK: - Setup Methods
    
     func fetchData() {
        viewModel.fetchFeedsContent { [weak self] in
            guard let self = self else { return }
            self.dataSource.updateFeeds(reels: self.viewModel.reels)
            self.adapter.performUpdates(animated: true)
        }
    }
}
