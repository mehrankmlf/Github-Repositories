//
//  MainTableViewCell.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let cellId = "cellId"
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = .borderColor
        view.layer.borderWidth = 0.5
        view.clipsToBounds = true
        return view
    }()
    
    lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var lblName : UILabel = {
       let label = UILabel()
        label.text = "Name : "
        label.textColor = .gray
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 12)
       return label
   }()
    
    lazy var lblRepoName : UILabel = {
       let label = UILabel()
        label.text = "RepoName : "
        label.textColor = .darkFontColor
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 12)
       return label
   }()
    
    lazy var lblRepoDesc : UILabel = {
       let label = UILabel()
        label.text = "RepoDesc : "
        label.textColor = .darkFontColor
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
       return label
   }()
    
    lazy var lblLanguageName : UILabel = {
       let label = UILabel()
        label.text = "RepoDesc : "
        label.textColor = .gray
        label.minimumScaleFactor = 0.5
        label.font = UIFont.boldSystemFont(ofSize: 14)
       return label
   }()
    
    override func prepareForReuse() {
       super.prepareForReuse()
       self.avatarImage.image = nil
        self.lblName.text = ""
        self.lblRepoName.text = ""
   }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        addSubviews()
        setupUI()
        setupAutoLayout()
    }
    
    private func addSubviews() {
        [containerView,
         avatarImage,
         lblName,
         lblRepoName,
         lblRepoDesc,
         lblLanguageName]
            .forEach { items in
                items.translatesAutoresizingMaskIntoConstraints = false
            }
        self.contentView.addSubview(containerView)
        self.containerView.addSubview(avatarImage)
        self.containerView.addSubview(lblName)
        self.containerView.addSubview(lblRepoName)
        self.containerView.addSubview(lblRepoDesc)
        self.containerView.addSubview(lblLanguageName)
    }
    private func setupUI() {
        backgroundColor = .background
    }
    
    func setupParameters(data : Repository) {
        let ownerData = data.owner
        self.lblName.text = ownerData?.login
        self.lblRepoName.text = data.name
        self.lblRepoDesc.text = data.repoDescription
        self.lblLanguageName.text = data.language
        self.avatarImage.imageFromServerURL(ownerData?.avatarURL ?? "", placeHolder: UIImage(named: "Placeholder"))
    }
}

extension MainTableViewCell {
    private func setupAutoLayout() {
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true

        avatarImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        avatarImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblName.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10).isActive = true
        lblName.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor).isActive = true
        lblName.rightAnchor.constraint(greaterThanOrEqualTo: avatarImage.rightAnchor, constant: 10).isActive = true
        
        lblRepoName.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10).isActive = true
        lblRepoName.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        lblRepoName.rightAnchor.constraint(greaterThanOrEqualTo: avatarImage.rightAnchor, constant: -10).isActive = true
        
        lblRepoDesc.topAnchor.constraint(equalTo: lblRepoName.bottomAnchor, constant: 10).isActive = true
        lblRepoDesc.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        lblRepoDesc.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        
        lblLanguageName.topAnchor.constraint(equalTo: lblRepoDesc.bottomAnchor, constant: 10).isActive = true
        lblLanguageName.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        lblLanguageName.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        lblLanguageName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
    }
}
