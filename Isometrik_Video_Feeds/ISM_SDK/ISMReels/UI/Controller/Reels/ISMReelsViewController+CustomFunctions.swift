//  ISMReelsViewController+CustomFunctions.swift
//
//  The file contains function for configting the layout of the reels View controller . It basically lays out collection view first and on it it lays out the header view which contains
//      - profile Image
//      - Categories ; and
//      - Coins View
//
//  Created by 3embed on 24/12/24.
//

import Foundation
import UIKit

//MARK: - Custom Functions
extension ISMReelsViewController{
    ///Responsible for laying out the collection view , header view on the ISMReelsViewController
    func configureUI(){
        addObserver()
        configureCollectionView()
        configureHeaderView()
        configureConstraints()
        configureLayout()
    }
    /// Configures the styling of collection view and adds it to the main view
    func configureCollectionView(){
        reelsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        reelsCollectionView.isPagingEnabled = true
        reelsCollectionView.backgroundColor = .sOblack
        view.addSubview(reelsCollectionView)
    }
    /// Configures the styling of profile button that displays the user's profile picture in the header .It also has a target to open profile View Controller
    func configureProfileView(){
        profileButton = UIButton()
        profileButton.setImage(UIImage(resource: .iconProfile), for: .normal)
        profileButton.backgroundColor = .soAppBase
        profileButton.layer.cornerRadius = 15
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
    }
    /// Responsible for styling the following , trending and Exclusive buttons , present in the header view of the ISMReelsViewController.These buttons are being added to stack View in order to show them equally distributed on the top
    func configureCategoryView(){
        followingButton = UIButton()
        configureCategoryButtons(button: followingButton, title: "Following", selector:  #selector(followingTapped), backgroundColor: .soGray)
        trendingButton = UIButton()
        configureCategoryButtons(button: trendingButton, title: "Trending", selector:  #selector(trendingTapped), backgroundColor: .soAppBase)
        exclusiveButton = UIButton()
        configureCategoryButtons(button: exclusiveButton, title: "Exclusive", selector: #selector(exclusiveTapped), backgroundColor: .soGray)
        
        holderStack = UIStackView()
        holderStack.translatesAutoresizingMaskIntoConstraints = false
        holderStack.axis = .horizontal
        holderStack.alignment = .fill
        holderStack.distribution = .fillEqually
        holderStack.spacing = 5
        
        holderStack.addArrangedSubview(followingButton)
        holderStack.addArrangedSubview(trendingButton)
        holderStack.addArrangedSubview(exclusiveButton)
    }
    /// Header View : which hold the profile button and category stack view is getting added as subviews in this method
    func configureHeaderView(){
        configureProfileView()
        configureCategoryView()
        configureCoinsView()
        headerView = UIView()
        headerView.defaultViewStyle()
        headerView.addSubview(profileButton)
        headerView.addSubview(holderStack)
        headerView.addSubview(coinsView)
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
        coinsLabel.textColor = .white
        coinsLabel.text = "0"
        coinsLabel.textAlignment = .center
        coinsLabel.font = .systemFont(ofSize: 15 , weight: .semibold)
        coinsView.addSubview(coinsLabel)
    }
    /// Button present on the top of he coins View on the header of the reels page
    func configureCoinsButton(){
        coinsButton = UIButton()
        coinsButton.translatesAutoresizingMaskIntoConstraints = false
        coinsButton.addTarget(self, action: #selector(coinsButtonTapped), for: .touchUpInside)
        coinsView.addSubview(coinsButton)
    }
    /// Overall constrainst of the ISMReelsViewController (CollectionView and Header View ) are getting set here
    func configureConstraints(){
        let constraints : [NSLayoutConstraint] = [
            //collectionView
            reelsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reelsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reelsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reelsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //header View
            headerView.leadingAnchor.constraint(equalTo: reelsCollectionView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: reelsCollectionView.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: reelsCollectionView.topAnchor , constant: 10),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            //Holder Stack View
            holderStack.heightAnchor.constraint(equalToConstant: 30),
            holderStack.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor),
            trendingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            holderStack.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            //ProfileView
            profileButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor , constant: 10),
            profileButton.widthAnchor.constraint(equalToConstant: 30),
            profileButton.heightAnchor.constraint(equalToConstant: 30),
            //Coin Image
            coinImage.heightAnchor.constraint(equalToConstant: 25),
            coinImage.widthAnchor.constraint(equalToConstant: 25),
            coinImage.centerXAnchor.constraint(equalTo: coinsView.centerXAnchor),
            coinImage.topAnchor.constraint(equalTo: coinsView.topAnchor , constant: 5),
            //CoinsLabel
            coinsLabel.centerXAnchor.constraint(equalTo: coinsView.centerXAnchor),
            coinsLabel.topAnchor.constraint(equalTo: coinImage.bottomAnchor, constant: 0),
            coinsLabel.bottomAnchor.constraint(equalTo: coinsView.bottomAnchor, constant: 0),
            //Coins View
            coinsView.leadingAnchor.constraint(equalTo: holderStack.trailingAnchor),
            coinsView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor , constant: 0),
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 8
        button.backgroundColor = backgroundColor
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.addTarget(self, action: selector, for: .touchUpInside)
    }
}
