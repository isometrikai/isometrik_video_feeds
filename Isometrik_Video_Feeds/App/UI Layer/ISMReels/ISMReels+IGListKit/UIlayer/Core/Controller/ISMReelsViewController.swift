//  ISMReelsViewController.swift
//
//  It is the starting point of the Reels View , we declare adapters that help in rendering cells containing reels
//
//  Created by 3embed on 20/12/24.
//
import UIKit
import IGListKit

/// Enables SectionControllers to return their own layout.
protocol CompositionLayoutCapable {
    func collectionViewSectionLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
}

class ISMReelsViewController: UIViewController {
    // MARK: - Outlets
    
    var profileButton: UIButton!
    var followingButton: UIButton!
    var trendingButton: UIButton!
    var exclusiveButton: UIButton!
    var holderStack: UIStackView!
    var headerView: UIView!
    
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
    
    // MARK: - ViewModel
    
    let viewModel = ReelsViewModel()
    
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
        fetchData()
    }
    
    deinit {
        print("ISMReelsViewController deinitialised")
    }
  
}

