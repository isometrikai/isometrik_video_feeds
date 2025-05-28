//  ISMReelsViewController+CustomFunctions.swift
//
//  The file contains function for configuring the layout of the reels View controller . It basically lays out collection view first and on it it lays out the header view which contains
//      - profile Image
//      - Categories ; and
//      - Coins View
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit
import SwiftUI

//MARK: - Custom Functions
extension ISMReelsViewController{
    ///Responsible for laying out the collection view , header view on the ISMReelsViewController
    func configureUI(){
        IVSReelsUtility.selectedReelsCategory = .trending
        makeObserversDictionary()
        configurePopularUserStackView()
        configureHeaderView()
        configureConstraints()
        configureLayout()
    }
    /// Configures the styling of collection view and adds it to the main view
    func configureCollectionView(){
        reelsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        reelsCollectionView.showsVerticalScrollIndicator = false
        reelsCollectionView.showsHorizontalScrollIndicator = false
        reelsCollectionView.isPagingEnabled = true
        reelsCollectionView.backgroundColor = .clear
        popularUserStackView.addArrangedSubview(reelsCollectionView)
    }
    /// Configures the styling of profile button that displays the user's profile picture in the header .It also has a target to open profile View Controller
    func configureProfileView(){
        profileButton = UIButton()
        profileButton.setImage(UIImage(resource: .iconProfile), for: .normal)
        profileButton.backgroundColor = IVSKit.shared.getThemeColor()
        profileButton.layer.cornerRadius = 15
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.isHidden = true
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
    }
    /// Configures the styling of top left social pop up button that helps in opening view from the header .
    func configureSocialOptionsButton(){
        socialiseOptionsButton = UIButton()
        socialiseOptionsButton.setImage(UIImage(resource: .iconSocialPopUP), for: .normal)
        socialiseOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        socialiseOptionsButton.isHidden = false
        socialiseOptionsButton.addTarget(self, action: #selector(socialOptionsTapped), for: .touchUpInside)
    }
    
    func configureFollowingUnderlineView() {
        followingButtonUnderlineView = UIView()
        followingButtonUnderlineView.backgroundColor = UIColor(resource: .sOwhite)
        followingButtonUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        followingButtonUnderlineView.isHidden = true
        followingButton.addSubview(followingButtonUnderlineView)
        NSLayoutConstraint.activate([
            followingButtonUnderlineView.heightAnchor.constraint(equalToConstant: 2),
            followingButtonUnderlineView.leadingAnchor.constraint(equalTo: followingButton.leadingAnchor,constant: 5),
            followingButtonUnderlineView.trailingAnchor.constraint(equalTo: followingButton.trailingAnchor,constant: -5),
            followingButtonUnderlineView.topAnchor.constraint(equalTo: followingButton.bottomAnchor, constant: 0)
        ])
    }
    
    func configureTrendingUnderlineView() {
        trendingButtonUnderlineView = UIView()
        trendingButtonUnderlineView.backgroundColor = UIColor(resource: .sOwhite)
        trendingButtonUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        trendingButtonUnderlineView.isHidden = false
        trendingButton.addSubview(trendingButtonUnderlineView)
        NSLayoutConstraint.activate([
            trendingButtonUnderlineView.heightAnchor.constraint(equalToConstant: 2),
            trendingButtonUnderlineView.leadingAnchor.constraint(equalTo: trendingButton.leadingAnchor,constant: 5),
            trendingButtonUnderlineView.trailingAnchor.constraint(equalTo: trendingButton.trailingAnchor,constant: -5),
            trendingButtonUnderlineView.topAnchor.constraint(equalTo: trendingButton.bottomAnchor, constant: 0)
        ])
    }
    
    func configureExclusiveUnderlineView() {
        exclusiveButtonUnderlineView = UIView()
        exclusiveButtonUnderlineView.backgroundColor = UIColor(resource: .sOwhite)
        exclusiveButtonUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        exclusiveButtonUnderlineView.isHidden = true
        exclusiveButton.addSubview(exclusiveButtonUnderlineView)
        NSLayoutConstraint.activate([
            exclusiveButtonUnderlineView.heightAnchor.constraint(equalToConstant: 2),
            exclusiveButtonUnderlineView.leadingAnchor.constraint(equalTo: exclusiveButton.leadingAnchor,constant: 5),
            exclusiveButtonUnderlineView.trailingAnchor.constraint(equalTo: exclusiveButton.trailingAnchor,constant: -5),
            exclusiveButtonUnderlineView.topAnchor.constraint(equalTo: exclusiveButton.bottomAnchor, constant: 0)
        ])
    }
    
    
    
    
    func configureUnderlineView() {
        configureFollowingUnderlineView()
        configureTrendingUnderlineView()
        configureExclusiveUnderlineView()
    }
    
    
    /// Responsible for styling the following , trending and Exclusive buttons , present in the header view of the ISMReelsViewController.These buttons are being added to stack View in order to show them equally distributed on the top
    func configureCategoryView(){
        followingButton = UIButton()
        configureCategoryButtons(button: followingButton, title: "Following", selector:  #selector(followingTapped), backgroundColor: UIColor.clear)
        trendingButton = UIButton()
        configureCategoryButtons(button: trendingButton, title: "Trending", selector:  #selector(trendingTapped), backgroundColor: UIColor.clear)
        exclusiveButton = UIButton()
        configureCategoryButtons(button: exclusiveButton, title: "Exclusive", selector: #selector(exclusiveTapped), backgroundColor: UIColor.clear)
        
        configureUnderlineView()
        
        holderStack = UIStackView()
        holderStack.translatesAutoresizingMaskIntoConstraints = false
        holderStack.axis = .horizontal
        holderStack.alignment = .fill
        holderStack.distribution = .fillEqually
        holderStack.spacing = 0
        
        holderStack.addArrangedSubview(followingButton)
        holderStack.addArrangedSubview(trendingButton)
        holderStack.addArrangedSubview(exclusiveButton)
    }
    
    /// This Stack view appears on the top left of the reels VC and it contains the socialise Options button , profile button and back Button
    func configureLeftStackView() {
        configureSocialOptionsButton()
        configureProfileView()
        configureBackButton()
        
        leftStackView = UIStackView()
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.axis = .horizontal
        leftStackView.spacing = 0
        leftStackView.distribution = .fillEqually
        leftStackView.alignment = .center
        
        leftStackView.addArrangedSubview(socialiseOptionsButton)
        leftStackView.addArrangedSubview(profileButton)
        leftStackView.addArrangedSubview(backButton)
        
    }
    
    func configureBackButton() {
        backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.clipsToBounds = true
        backButton.setImage(UIImage(resource: .iconBack), for: .normal)
        backButton.isHidden = true
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
        //backButton
        backButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

    
    /// Header View : which hold the profile button and category stack view is getting added as subviews in this method
    func configureHeaderView(){
        configureLeftStackView()
        configureCategoryView()
        configureCoinsView()
        headerView = UIView()
        headerView.defaultViewStyle()
        headerView.addSubview(leftStackView)
        headerView.addSubview(holderStack)
        headerView.addSubview(coinsView)
        view.addSubview(topShade)
        view.addSubview(headerView)
    }
    /// configures the styling  of coins view
    func configureCoinsView(){
        coinsView = UIView()
        coinsView.defaultViewStyle()
        configureCoinsImageView()
        configureCoinLabel()
        configureCoinsButton()
    }
    /// configure coins image styling
    func configureCoinsImageView(){
        coinImage = UIImageView()
        coinImage.defaultImageViewStyle()
        coinImage.image = UIImage(resource: .iconCoin)
        coinsView.addSubview(coinImage)
    }
    /// Configure Coins Label is a method to style the label showing coins value
    func configureCoinLabel(){
        coinsLabel = UILabel()
        coinsLabel.defaultViewStyle()
        coinsLabel.textColor = UIColor(resource: .sOwhite)
        coinsLabel.text = IVSKit.getWalletValue() ?? IVSDefaultSettings.walletDefaultValue
        coinsLabel.textAlignment = .center
        coinsLabel.font = .systemFont(ofSize: 10 , weight: .semibold)
        coinsView.addSubview(coinsLabel)
    }
    /// Button present on the top of he coins View on the header of the reels page
    func configureCoinsButton(){
        coinsButton = UIButton()
        coinsButton.translatesAutoresizingMaskIntoConstraints = false
        coinsButton.addTarget(self, action: #selector(coinsButtonTapped), for: .touchUpInside)
        coinsView.addSubview(coinsButton)
    }
    
    func configureFollowingImageView() {
        followingImageView = UIImageView()
        followingImageView.defaultImageViewStyle(customContentMode: .scaleAspectFit)
        followingImageView.image = UIImage(resource: .noFollowers)
        followingImageView.clipsToBounds = true
        followingStackView.addArrangedSubview(followingImageView)
        
        NSLayoutConstraint.activate([
            followingImageView.topAnchor.constraint(equalTo: followingStackView.topAnchor , constant: 120),
            followingImageView.heightAnchor.constraint(equalToConstant: 200),
            followingImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

    func configureFollowingLabel(){
        followingHeaderLabel = UILabel()
        followingHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        followingHeaderLabel.text = "Follow User"
        followingHeaderLabel.font = .systemFont(ofSize: 15 , weight: .bold)
        followingHeaderLabel.textColor = UIColor(resource: .sOwhite)
        followingHeaderLabel.textAlignment = .center
        followingHeaderLabel.numberOfLines = 0
        followingStackView.addArrangedSubview(followingHeaderLabel)
        
        NSLayoutConstraint.activate([
            followingHeaderLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func configureSubHeadingLabel(){
        followingSubHeaderLabel = UILabel()
        followingSubHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        followingSubHeaderLabel.text = "You are not following anyone , Follow some users to see their posts here."
        followingSubHeaderLabel.textColor = UIColor(resource: .sOwhite)
        
        followingSubHeaderLabel.font = .systemFont(ofSize: 14 , weight: .semibold)
        followingSubHeaderLabel.textAlignment = .center
        followingSubHeaderLabel.numberOfLines = 0
        followingStackView.addArrangedSubview(followingSubHeaderLabel)
        NSLayoutConstraint.activate([
            followingSubHeaderLabel.heightAnchor.constraint(equalToConstant: 40),
            followingSubHeaderLabel.leadingAnchor.constraint(equalTo: followingStackView.leadingAnchor, constant: 20),
            followingSubHeaderLabel.trailingAnchor.constraint(equalTo: followingStackView.trailingAnchor, constant: -20)
        ])
    }
    
    func configurePopularUserButton() {
        findPeopleButtonStackView = UIStackView()
        findPeopleButtonStackView.axis = .horizontal
        findPeopleButtonStackView.distribution = .fillEqually
        findPeopleButtonStackView.spacing = 5
        findPeopleButtonStackView.alignment = .center
        findPeopleButtonStackView.backgroundColor = .clear
        findPeopleButton = UIButton()
        findPeopleButton.translatesAutoresizingMaskIntoConstraints = false
        findPeopleButton.setTitle("Find People To Follow", for: .normal)
        findPeopleButton.backgroundColor = IVSKit.shared.getThemeColor()
        findPeopleButton.setTitleColor(UIColor(resource: .sOwhite), for: .normal)
        findPeopleButton.layer.cornerRadius = 15
        findPeopleButton.addTarget(self, action: #selector(findNewUsersTapped), for: .touchUpInside)
        findPeopleButtonStackView.addArrangedSubview(findPeopleButton)
        popularUserStackView.addArrangedSubview(findPeopleButtonStackView)
        
        
        NSLayoutConstraint.activate([
            findPeopleButton.heightAnchor.constraint(equalToConstant: 40),
            findPeopleButton.leadingAnchor.constraint(equalTo: popularUserStackView.leadingAnchor, constant: 20),
            findPeopleButton.trailingAnchor.constraint(equalTo: popularUserStackView.trailingAnchor, constant: -20),
        ])
    }
    
    
    func configureFollowingStackView(){
        followingStackView = UIStackView()
        followingStackView.translatesAutoresizingMaskIntoConstraints = false
        followingStackView.axis = .vertical
        followingStackView.spacing = 5
        followingStackView.distribution = .fillProportionally
        followingStackView.backgroundColor = .clear
        
        configureFollowingImageView()
        configureFollowingLabel()
        configureSubHeadingLabel()
        popularUserStackView.addArrangedSubview(followingStackView)
        
    }
  
    func configurePopularUserStackView() {
        popularUserStackView = UIStackView()
        popularUserStackView.translatesAutoresizingMaskIntoConstraints = false
        popularUserStackView.axis = .vertical
        popularUserStackView.spacing = 10
        popularUserStackView.alignment = .fill
        popularUserStackView.distribution = .fill
        popularUserStackView.backgroundColor = .black
        self.view.addSubview(popularUserStackView)
        configureFollowingStackView()
        configurePopularUserButton()
        configureCollectionView()
        
        followingStackView.isHidden = true
        findPeopleButton.isHidden = true
        findPeopleButtonStackView.isHidden = true
        
    }
    /// Overall constrainst of the ISMReelsViewController (CollectionView and Header View ) are getting set here
    func configureConstraints(){
        let constraints : [NSLayoutConstraint] = [
            //popular user stack view
            popularUserStackView.topAnchor.constraint(equalTo: view.topAnchor), // Updated to use view.topAnchor
            popularUserStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            popularUserStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popularUserStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Constraints for bottom shade
            topShade.topAnchor.constraint(equalTo: popularUserStackView.topAnchor),
            topShade.leadingAnchor.constraint(equalTo: popularUserStackView.leadingAnchor),
            topShade.trailingAnchor.constraint(equalTo: popularUserStackView.trailingAnchor),
            topShade.heightAnchor.constraint(equalToConstant: 100),
            
            //header View
            headerView.leadingAnchor.constraint(equalTo: popularUserStackView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: popularUserStackView.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            //Holder Stack View
            holderStack.heightAnchor.constraint(equalToConstant: 30),
            holderStack.centerYAnchor.constraint(equalTo: leftStackView.centerYAnchor),
            trendingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            holderStack.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            //ProfileView
            leftStackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor , constant: 10),
            leftStackView.widthAnchor.constraint(equalToConstant: 25),
            leftStackView.heightAnchor.constraint(equalToConstant: 25),
            //Coin Image
            coinImage.heightAnchor.constraint(equalToConstant: 20),
            coinImage.widthAnchor.constraint(equalToConstant: 20),
            coinImage.centerXAnchor.constraint(equalTo: coinsView.centerXAnchor),
            coinImage.topAnchor.constraint(equalTo: coinsView.topAnchor , constant: 5),
            //CoinsLabel
            coinsLabel.centerXAnchor.constraint(equalTo: coinsView.centerXAnchor),
            coinsLabel.topAnchor.constraint(equalTo: coinImage.bottomAnchor, constant: 0),
            coinsLabel.bottomAnchor.constraint(equalTo: coinsView.bottomAnchor, constant: 0),
            //Coins View
            coinsView.leadingAnchor.constraint(greaterThanOrEqualTo: holderStack.trailingAnchor),
            coinsView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor , constant: -10),
            coinsView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor , constant: 0),
            coinsView.topAnchor.constraint(equalTo: headerView.topAnchor , constant: 0),
            //Coins Button
            coinsButton.leadingAnchor.constraint(equalTo: coinsView.leadingAnchor),
            coinsButton.trailingAnchor.constraint(equalTo: coinsView.trailingAnchor),
            coinsButton.topAnchor.constraint(equalTo: coinsView.topAnchor),
            coinsButton.bottomAnchor.constraint(equalTo: coinsView.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    /// To configure compositional layout
    func configureLayout() {
        let layout = UICollectionViewCompositionalLayout {
            [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment)
            -> NSCollectionLayoutSection? in
            // Step 1: Weak self capture to avoid retain cycles
            guard let self = self else { return nil }
            // Step 2: Retrieve the section controller for the current section
            let controller = self.adapter.sectionController(forSection: sectionIndex)
            // Step 3: Ensure the controller conforms to a protocol (CompositionLayoutCapable)
            guard let controller = controller as? CompositionLayoutCapable else {
                return nil
            }
            // Step 4: Ask the controller to provide a layout for the section
            return controller.collectionViewSectionLayout(layoutEnvironment: layoutEnvironment)
        }
        // Update the collection view layout
        self.reelsCollectionView.setCollectionViewLayout(layout, animated: false)
        self.adapter.collectionView = self.reelsCollectionView
        self.adapter.collectionView?.refreshControl = self.refreshControl
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    @objc func didPullToRefresh() {
        IVSReelsUtility.postStopVideoPlayback()
        switch IVSReelsUtility.selectedReelsCategory {
        case .following:
            viewModel.homeOffset = 0
            viewModel.homeReels = []
            IVSReelsUtility.showPopularUsers ? fetchPopularData() :fetchHomeData()
        case .trending:
            viewModel.offset = 0
            viewModel.reels = []
            fetchData()
        case .exclusive:
            viewModel.exclusiveOffset = 0
            viewModel.exclusiveReels = []
            fetchExclusiveData()
        }
        
    }
    
    /// Utility function used in order to give default styling to the header category buttons on ISMReelsViewController
    /// - Parameters:
    ///   - button: Type of button being sent namely - followingButton , trendingButton or ExclusiveButton
    ///   - title: Title that is to be given to button
    ///   - selector: The acton selectors that must be called respectively
    ///   - backgroundColor: Default background color that needs to be set while viewing the screen
    func configureCategoryButtons(button : UIButton,title : String , selector : Selector ,backgroundColor : UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12 , weight: .semibold)
        button.layer.cornerRadius = 8
        button.backgroundColor = backgroundColor
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    func getMostVisibleCell() -> UICollectionViewCell? {
        let collectionView = self.reelsCollectionView
        let visibleCells = collectionView.visibleCells
        
        // Find the cell that is most visible
        let mostVisibleCell = visibleCells.max { (cell1, cell2) -> Bool in
            let rect1 = collectionView.convert(cell1.frame, to: collectionView.superview)
            let rect2 = collectionView.convert(cell2.frame, to: collectionView.superview)
            
            let intersection1 = rect1.intersection(collectionView.frame)
            let intersection2 = rect2.intersection(collectionView.frame)
            
            return intersection1.height < intersection2.height
        }
        
        return mostVisibleCell
    }
}

struct ISMReelsViewControllerPreview : PreviewProvider{
    static var previews: some View {
        IVSPreviewViewcontrollers {
            ISMReelsViewController()
        }
        .ignoresSafeArea(.all)
    }
}
