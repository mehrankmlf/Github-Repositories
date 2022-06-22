//
//  MainViewController.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import UIKit
import SwiftUI

class MainViewController: BaseViewController  {
    
    var contentView : MainView?
    var viewModel : MainViewModel!
    var throttler : ThrottleBehavierProtocol?
    private var dataSource:TableViewCustomDataSource<Repository>?
    
    init(viewModel : MainViewModel,
         contentView : MainView, throttler: ThrottleBehavierProtocol) {
        self.viewModel = viewModel
        self.contentView = contentView
        self.throttler = throttler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegateHandler()
        self.setupUI()
        self.bindViewModel()
        self.throttleHandler()
    }
    
    private func delegateHandler() {
        super.delegate = self
        contentView?.viewContainer.emptyState.delegate = self
    }
    
    private func setupUI() {
        self.title = viewModel?.screenTitle
        view.backgroundColor = .background
        self.navigationControllerHandler()
        self.setupTableView()
    }
    
    private func navigationControllerHandler() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = self.contentView?.searchController
        self.navigationItem.searchController?.searchBar.delegate = self
        self.definesPresentationContext = true
    }
    
    private func bindViewModel() {
        self.viewModel?.loadinState
            .sink(receiveValue: {  state in
                guard let view = self.contentView else {return}
                super.setViewState(state: state, viewContainer: view.viewContainer)
            }).store(in: &bag)
        
        self.viewModel?.$publishedItems
            .compactMap({ $0 })
            .sink { [weak self] data in
                self?.renderTableViewdataSource(data)
            }.store(in: &bag)
        
        self.dataSource?.$loadNextPage
            .sink(receiveValue: { data in
                guard data == true else {return}
                self.viewModel?.didLoadNextPage()
            }).store(in: &bag)
    }
    
    private func throttleHandler() {
        self.throttler?.on { [weak self] query in
            self?.viewModel?.didSearch(query: query, page: 1)
        }
        
        self.throttler?.emptyValue {
            self.dataSource?.models = nil
            DispatchQueue.main.async {
                self.contentView?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        contentView?.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.cellId)
    }
    
    private func renderTableViewdataSource(_ itemlists:[Repository]) {
        dataSource = .displayData(for: itemlists, withCellidentifier: MainTableViewCell.cellId)
        self.contentView?.tableView.dataSource = dataSource
        self.contentView?.tableView.delegate = self
        self.contentView?.tableView.reloadData()
    }
}

extension MainViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let safeQuery = searchBar.text?.whiteSpacesRemoved()
        self.throttler?.receive(safeQuery ?? "")
    }
}

extension MainViewController : EmptyStateDelegate, ShowEmptyStateProtocol {
    func showEmptyStateView(title: String?, errorType: EmptyStateErrorType, isShow: Bool) {
        contentView?.viewContainer.emptyState.show(title: title ?? "",
                                                   errorType: errorType,
                                                   isShow: isShow)
    }
    
    func emptyStateButtonClicked() {
        self.contentView?.searchController.searchBar.text = nil
        contentView?.viewContainer.emptyState.hide()
    }
}

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == viewModel.publishedItems.count - 1,
                               viewModel.currentPage < viewModel.totalPageCount - 1,
                               !viewModel.isSearching
        else {return}
        viewModel.didLoadNextPage()
    }
}
