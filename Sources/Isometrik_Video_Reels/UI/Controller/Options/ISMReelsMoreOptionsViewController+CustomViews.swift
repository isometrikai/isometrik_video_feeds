//
//  ISMReelsMoreOptionsViewController+CustomViews.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 31/12/24.
//

import Foundation
import UIKit

extension ISMReelsMoreOptionsViewController {
    
    func setUp() {
        configureMoreOptionsButton()
        configureContainerView()
        configureTopView()
        configureCollectionView()
        configureConstraints()
    }
    
    func configureContainerView() {
        containerView = UIView()
        containerView.backgroundColor = UIColor(resource: .sOwhite)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        moreOptionsButton.addSubview(containerView)
    }
    
    func configureMoreOptionsButton() {
        moreOptionsButton = UIButton()
        moreOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        moreOptionsButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        view.addSubview(moreOptionsButton)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    func configureCollectionView() {
        moreOptionsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        moreOptionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        moreOptionsCollectionView.delegate = self
        moreOptionsCollectionView.dataSource = self
        moreOptionsCollectionView.register(ISMReelsOptionsCollectionViewCell.self, forCellWithReuseIdentifier: ISMReelsOptionsCollectionViewCell.identifier)
        containerView.addSubview(moreOptionsCollectionView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            moreOptionsButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            moreOptionsButton.topAnchor.constraint(equalTo: self.view.topAnchor),
            moreOptionsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            moreOptionsButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            moreOptionsCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            moreOptionsCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            moreOptionsCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            moreOptionsCollectionView.topAnchor.constraint(equalTo: barView.topAnchor , constant: 10),
            
            containerView.leadingAnchor.constraint(equalTo: moreOptionsButton.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: moreOptionsButton.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: moreOptionsButton.bottomAnchor),
            containerView.heightAnchor.constraint(equalTo: moreOptionsButton.heightAnchor, multiplier: 0.45),
            
            userName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            userName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 10),
            userName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor ,  constant: -10),
            userName.heightAnchor.constraint(equalToConstant: 20),
            
            views.topAnchor.constraint(equalTo: userName.bottomAnchor , constant:  5),
            views.leadingAnchor.constraint(equalTo: containerView.leadingAnchor ,  constant: 10),
            views.trailingAnchor.constraint(equalTo: containerView.trailingAnchor ,  constant: -10),
            views.heightAnchor.constraint(equalToConstant: 20),
            
            barView.heightAnchor.constraint(equalToConstant: 1),
            barView.topAnchor.constraint(equalTo: views.bottomAnchor , constant: 10),
            barView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 10),
            barView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -10),
            
            
        ])
    }
    
    func configureTopView(){
        //username
        userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.font = UIFont.systemFont(ofSize: 14)
        userName.text = "Username"
        userName.textColor = UIColor(resource: .sOblack)
        containerView.addSubview(userName)
        
        //Views
        views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 10)
        views.text = "Views"
        views.textColor = UIColor(resource: .sOblack)
        containerView.addSubview(views)
        
        //bar view
        barView = UIView()
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.backgroundColor = .lightGray
        containerView.addSubview(barView)
    }
    
    func chooseRandomColor() -> UIColor {
        return UIColor(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: 1)
    }
}
