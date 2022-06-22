//
//  MainViewModel.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation
import Combine

typealias MainBaseViewModel = ViewModelBaseProtocol & MainViewModelInput & MainViewModelOutput

protocol MainViewModelInput {
    func didLoadNextPage()
    func didSearch(query: String, page: Int)
}

protocol MainViewModelOutput {
    var screenTitle: String { get }
    func callSearchService(query: RepositoriesQuery, page: Int)
}

final class MainViewModel : ObservableObject, MainBaseViewModel {

    var seachRepositories: SeachRepositoriesProtocol
    var bag = Set<AnyCancellable>()
    
    @Published var publishedItems : [Repository] = []
    @Published var query : String = ""
    
    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var isSearching = false
    
    // MARK: - OUTPUT
    
    var screenTitle: String = NavbarTitle.home.desc
    var loadinState = CurrentValueSubject<ViewModelStatus, Never>(.dismissAlert)
    
    // MARK: - Init

    init(seachRepositories : SeachRepositoriesProtocol) {
        self.seachRepositories = seachRepositories
    }
    
    private func appendPage(_ repositoriesPage: RepositoryBaseModel?) {
        guard let data = repositoriesPage, let items = data.items else { return }
        self.totalPageCount = data.total ?? 1
        self.publishedItems.append(contentsOf: items)
    }
    
    private func resetPages() {
        currentPage = 1
        totalPageCount = 1
        publishedItems.removeAll()
    }
    
    func callSearchService(query: RepositoriesQuery, page: Int) {
        
        self.query = query.query
        self.isSearching = true

        self.loadinState.send(.loadStart)
        self.seachRepositories.getData(query: query.query, page: page)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    self?.loadinState.send(.emptyStateHandler(title: error.desc, isShow: true))
                }
                self?.loadinState.send(.dismissAlert)
                self?.isSearching = false
            } receiveValue: { [weak self] data in
                self?.appendPage(data)
            }
            .store(in: &bag)
    }
    
    private func update(query: RepositoriesQuery, page: Int) {
        resetPages()
        callSearchService(query: query, page: page)
    }
}

// MARK: - INPUT. View event methods

extension MainViewModel {
    
    func didLoadNextPage() {
        currentPage += 1
        self.callSearchService(query: .init(query: self.query), page: currentPage)
    }
    
    func didSearch(query: String, page: Int) {
        self.update(query: RepositoriesQuery(query: query), page: page)
    }
}

