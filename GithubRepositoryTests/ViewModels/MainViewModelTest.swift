//
//  MainViewModelTest.swift
//  GithubRepositoryTests
//
//  Created by Mehran on 3/27/1401 AP.
//

import XCTest
import Combine

@testable import GithubRepository

class MainViewModelTest: XCTestCase {
    
    var mocksearchService : MockLoginService!
    var viewModelToTest : MainViewModel!
    private var bag : Set<AnyCancellable> = []

    override func setUp()  {
        super.setUp()
        mocksearchService = MockLoginService()
        viewModelToTest = MainViewModel(seachRepositories: mocksearchService)
    }
    
    override func tearDown() {
        mocksearchService = nil
        viewModelToTest = nil
        super.tearDown()
    }
    
    func testRepositorySearchService_WhenServieCalled_ShouldReturnResponse() {
        
        let data = RepositoryBaseModel.mockData

        let expectation = XCTestExpectation(description: "State is set to Token")

        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
              expectation.fulfill()
        }.store(in: &bag)

        mocksearchService.fetchedResult = Result.success(data).publisher.eraseToAnyPublisher()
        viewModelToTest.callSearchService(query: "", itemCount: 0)

        wait(for: [expectation], timeout: 1)
    }
    
    func testRepositorySearchService_WhenServieCalled_ShouldReturnNil() {
        
        let data = RepositoryBaseModel()

        let expectation = XCTestExpectation(description: "State is set to Token")

        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
              expectation.fulfill()
        }.store(in: &bag)

        mocksearchService.fetchedResult = Result.success(data).publisher.eraseToAnyPublisher()
        viewModelToTest.callSearchService(query: "", itemCount: 0)

        wait(for: [expectation], timeout: 1)
    }
}
