//
//  MockServices.swift
//  GithubRepositoryTests
//
//  Created by Mehran on 3/27/1401 AP.
//

import XCTest
import Combine

@testable import GithubRepository

class MockLoginService : SeachRepositoriesProtocol {
    var fetchedResult : AnyPublisher <RepositoryBaseModel?, APIError>!
    func getData(query: String, itemsCount: Int) -> AnyPublisher <RepositoryBaseModel?, APIError> {
        return fetchedResult
    }
}
