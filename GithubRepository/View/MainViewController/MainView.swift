//
//  MainView.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import UIKit

final class MainView: UIView {
    
    private var safeArea: UILayoutGuide!
    
    lazy var viewContainer : UIView = {
        let viewContainer = UIView()
        viewContainer.backgroundColor = .white
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        return viewContainer
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Repositories"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var initialRepoLabel: UILabel = {
        let label = UILabel()
        label.text = "Search repositories ..."
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor.systemGray4
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .prominent
        return searchController
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        addSubviews()
        makeAutolayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(viewContainer)
        viewContainer.addSubview(tableView)
    }
    
    private func setupUI() {
        backgroundColor = .background
        safeArea = self.safeAreaLayoutGuide
    }
}

extension MainView {
    private func makeAutolayout() {
        NSLayoutConstraint.activate([
            viewContainer.topAnchor.constraint(equalTo: safeArea.topAnchor),
            viewContainer.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            viewContainer.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.viewContainer.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.viewContainer.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.viewContainer.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.viewContainer.bottomAnchor)
        ])
    }
}
