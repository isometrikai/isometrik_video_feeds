//
//  ISMReelsCommentsViewController.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 06/01/25.
//

import Foundation
import UIKit

class ISMReelsCommentsViewController: UIViewController {
    //MARK: - Outlets
    var containerView : UIView!
    var dismissButton : UIButton!
    var viewsCountLabel : UILabel!
    var dividerView : UIView!
    var commentsTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}


extension ISMReelsCommentsViewController{
    
    func setUp(){
        self.view.backgroundColor = .clear
        configureDismissButton()
        configureContainerView()
        configureViewsCountLabel()
        configuresDividerView()
        configureTableView()
        setUpConstraints()
    }
    
    func configureContainerView(){
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(resource: .sOwhite)
        containerView.layer.cornerRadius = 30
        containerView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
        containerView.layer.masksToBounds = true
        dismissButton.addSubview(containerView)
    }
    
    func configureDismissButton(){
        dismissButton = UIButton()
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.backgroundColor = .clear
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        self.view.addSubview(dismissButton)
    }
    
    func configureViewsCountLabel(){
        viewsCountLabel = UILabel()
        viewsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsCountLabel.text = "100 Views"
        viewsCountLabel.font = UIFont.systemFont(ofSize: 12)
        containerView.addSubview(viewsCountLabel)
    }
    
    func configuresDividerView(){
        dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = UIColor(resource: .sOblack)
        containerView.addSubview(dividerView)
    }
    
    func configureTableView(){
        commentsTableView = UITableView()
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        commentsTableView.register(ISMReelsCommentsView.self, forCellReuseIdentifier: "CommentCell")
        self.containerView.addSubview(commentsTableView)
    }

    @objc func dismissAction(){
        self.dismiss(animated: true)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            //dismiss Button
            dismissButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            dismissButton.topAnchor.constraint(equalTo: self.view.topAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            //container View
            containerView.topAnchor.constraint(equalTo: self.dismissButton.topAnchor , constant: 250),
            containerView.leftAnchor.constraint(equalTo: self.dismissButton.leftAnchor , constant: 0),
            containerView.rightAnchor.constraint(equalTo: self.dismissButton.rightAnchor , constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.dismissButton.bottomAnchor , constant: 0),
            
            //Views Count
            viewsCountLabel.topAnchor.constraint(equalTo: containerView.topAnchor , constant: 10),
            viewsCountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 10),
            viewsCountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: 10),
            viewsCountLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //Divider View
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 0),
            dividerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: 0),
            dividerView.topAnchor.constraint(equalTo: viewsCountLabel.bottomAnchor , constant: 20),
            
            //TABLE ViEW
            commentsTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor , constant: 0),
            commentsTableView.topAnchor.constraint(equalTo: dividerView.topAnchor, constant: 20),
            commentsTableView.leadingAnchor.constraint(equalTo: viewsCountLabel.leadingAnchor),
            commentsTableView.trailingAnchor.constraint(equalTo: viewsCountLabel.trailingAnchor),
            
        ])
        
    }
}

extension ISMReelsCommentsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as? ISMReelsCommentsView else {
                  return UITableViewCell()
              }
              cell.configure(profileImage: UIImage(named: "profile"), name: "User \(indexPath.row)", comment: "This is a sample comment for row \(indexPath.row).")
              return cell
    }
    
    
}
