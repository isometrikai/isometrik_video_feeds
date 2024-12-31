//
//  ISMReelsMoreOptionsViewController.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 31/12/24.
//

import UIKit
enum MediaOptions{
    case bookmark
    case share
    case download
    case copyLink
    case record
    case report
}

class ISMReelsMoreOptionsViewController: UIViewController {
    var moreOptionsCollectionView: UICollectionView!
    var moreOptionsButton: UIButton!
    var containerView : UIView!
    
    var userName : UILabel!
    var views : UILabel!
    
    var barView : UIView!
    
    var mediaOptions: [MediaOptions] = [.bookmark , .share , .download , .copyLink , .record , .report]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
       
    }
    
    func setUp() {
        configureMoreOptionsButton()
        contaienrView()
        configureTopView()
        configureCollectionView()
        configureConstraints()
    }
    func contaienrView() {
        containerView = UIView()
        containerView.backgroundColor = .white
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
        userName.textColor = .black
        containerView.addSubview(userName)
        
        //Views
        views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 10)
        views.text = "Views"
        views.textColor = .black
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

extension ISMReelsMoreOptionsViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mediaOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ISMReelsOptionsCollectionViewCell.identifier, for: indexPath) as? ISMReelsOptionsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(option: mediaOptions[indexPath.item], color: chooseRandomColor())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width  / 3.5
        let height = (collectionView.bounds.height / 2) - 50
        return CGSize(width: width, height: width)
    }
}


class ISMReelsOptionsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ISMReelsOptionsCollectionViewCell"
    
    var optionsImageView: UIImageView!
    var optionsLabel: UILabel!
    var containerView: UIView!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
      
    }
    
    func setUp() {
        // Container View for rounded corners and border
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.backgroundColor = UIColor.clear
        contentView.addSubview(containerView)
        
        // Image View
        optionsImageView = UIImageView()
        optionsImageView.translatesAutoresizingMaskIntoConstraints = false
        optionsImageView.contentMode = .scaleAspectFit
        containerView.addSubview(optionsImageView)
        
        // Label
        optionsLabel = UILabel()
        optionsLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsLabel.font = UIFont.systemFont(ofSize: 14)
        optionsLabel.textAlignment = .center
        optionsLabel.textColor = .black
        containerView.addSubview(optionsLabel)
        
  
        
        
        
        
        // Constraints
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
     
            optionsImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            optionsImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            optionsImageView.widthAnchor.constraint(equalToConstant: 40),
            optionsImageView.heightAnchor.constraint(equalToConstant: 40),
            
            optionsLabel.topAnchor.constraint(equalTo: optionsImageView.bottomAnchor, constant: 5),
            optionsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            optionsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            optionsLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -10)
            
            
        ])
    }
    
    func configure(option: MediaOptions, color: UIColor) {
        containerView.layer.borderColor = color.cgColor
        
        switch option {
        case .bookmark:
            optionsImageView.image = UIImage(systemName: "bookmark")
            optionsLabel.text = "Bookmark"
        case .share:
            optionsImageView.image = UIImage(systemName: "square.and.arrow.up")
            optionsLabel.text = "Share"
        case .download:
            optionsImageView.image = UIImage(systemName: "arrow.down.circle")
            optionsLabel.text = "Download"
        case .copyLink:
            optionsImageView.image = UIImage(systemName: "link")
            optionsLabel.text = "Copy Link"
        case .record:
            optionsImageView.image = UIImage(systemName: "record.circle")
            optionsLabel.text = "Record"
        case .report:
            optionsImageView.image = UIImage(systemName: "flag")
            optionsLabel.text = "Report"
        }
    }
}

