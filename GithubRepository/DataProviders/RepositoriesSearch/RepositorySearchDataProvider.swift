//
//  RepositorySearchDataProvider.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation
import Combine

protocol SeachRepositoriesProtocol : AnyObject {
    func getData(query: String, page: Int)  -> AnyPublisher<RepositoryBaseModel?, APIError>
}

final class RepositorySearchDataProvider : BaseAPI<Networking>, SeachRepositoriesProtocol {
    func getData(query: String, page: Int) -> AnyPublisher<RepositoryBaseModel?, APIError> {
        self.fetchData(target: .searchRepositories(query: query, page: page), responseClass: RepositoryBaseModel.self)
    }
}
