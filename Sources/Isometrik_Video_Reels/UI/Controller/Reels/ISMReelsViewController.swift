//  ISMReelsViewController.swift
//
//  It is the starting point of the Reels View , we declare adapters that help in rendering cells containing reels
//
//  Created by 3embed on 20/12/24.
//
import UIKit
import IGListKit
import SwiftUI
/// Enables SectionControllers to return their own layout.
protocol CompositionLayoutCapable {
    func collectionViewSectionLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
}

class ISMReelsViewController: UIViewController {
    // MARK: - Outlets
    //Header
    var leftStackView : UIStackView!
    var socialiseOptionsButton: UIButton!
    var backButton : UIButton!
    var profileButton: UIButton!
    var followingButton: UIButton!
    var followingButtonUnderlineView : UIView!
    var trendingButton: UIButton!
    var trendingButtonUnderlineView : UIView!
    var exclusiveButton: UIButton!
    var exclusiveButtonUnderlineView : UIView!
    var holderStack: UIStackView!
    var coinsView : UIView!
    var coinsButton : UIButton!
    var coinsLabel : UILabel!
    var coinImage : UIImageView!
    var headerView: UIView!
    
    var popularUserStackView : UIStackView!
    var followingStackView : UIStackView!
    var followingHeaderLabel : UILabel!
    var followingSubHeaderLabel : UILabel!
    var followingImageView : UIImageView!
    var findPeopleButton : UIButton!
    var findPeopleButtonStackView : UIStackView!
    
    var topShade: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "TopShade")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
  
    var observersMap:[ [NSNotification.Name: Selector] ] = []
    //Collection View
    let reelsCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            NSCollectionLayoutSection(
                group: .vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(1.0)
                    ),
                    subitems: []
                )
            )
        }
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    let refreshControl = UIRefreshControl()
    
    // MARK: - ViewModel
    
    let viewModel = ISMReelsViewModel()
    var configDelegate : IVSDelegate?
    // MARK: - IGListKit Declarations
    
    let dataSource = ISMReelsDataSource()
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 1)
        adapter.dataSource = dataSource
        adapter.collectionView = reelsCollectionView
        return adapter
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dataSource.viewModel = self.viewModel
        fetchData()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(clearCache),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
    }
    
    @objc func clearCache() {
        ImageCacheManager.shared.clearCache()
    }
    
    deinit {
        removeCustomObservers()
        print("ISMReelsViewController deinitialised")
    }
  
    // MARK: - Scroll to Next Cell
    @objc func scrollToNextCell() {
         guard let collectionView = adapter.collectionView else { return }

         // Find the current visible index paths
         let visibleIndexPaths = collectionView.indexPathsForVisibleItems.sorted()
         guard let currentIndexPath = visibleIndexPaths.first else { return }

         // Calculate the next item index
         let nextIndexPath = IndexPath(item: currentIndexPath.item + 1, section: currentIndexPath.section)

         // Check if the next item index is within bounds
         let numberOfItems = collectionView.numberOfItems(inSection: currentIndexPath.section)
         if nextIndexPath.item < numberOfItems {
             collectionView.scrollToItem(at: nextIndexPath, at: .centeredVertically, animated: true)
         } else if currentIndexPath.section + 1 < collectionView.numberOfSections {
             // Move to the first item of the next section
             let nextSectionIndexPath = IndexPath(item: 0, section: currentIndexPath.section + 1)
             collectionView.scrollToItem(at: nextSectionIndexPath, at: .centeredVertically, animated: true)
         } else {
             print("Reached the end of the collection view.")
         }

     }
}

