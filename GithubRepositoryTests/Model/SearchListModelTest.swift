//
//  SearchListModelTest.swift
//  GithubRepositoryTests
//
//  Created by Mehran on 3/27/1401 AP.
//

import XCTest
@testable import GithubRepository

class SearchListModelTest: XCTestCase {
    
    var sut : Repository!

    override func setUp() {
        super.setUp()
        sut = Repository(id: 1, name: "test", fullName: "test", starsCount: 2, repoDescription: "testtest", openIssuesCount: 3, language: "swift", owner: nil)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSearchListModel_WhenDataProvided_ShouldBeCodable() {
        XCTAssertTrue(sut as Any is Decodable)
    }
    
    func testSearchListModel_WhenDataProvided_ShouldBeString() {
        XCTAssertTrue(sut?.name == "test")
        XCTAssertTrue(sut?.fullName == "test")
        XCTAssertTrue(sut?.repoDescription == "testtest")
        XCTAssertTrue(sut?.language == "swift")
    }
    
    func testSearchListModel_WhenDataProvided_ShouldBeInt() {
        XCTAssertTrue(sut?.id == 1)
        XCTAssertTrue(sut?.starsCount == 2)
        XCTAssertTrue(sut?.openIssuesCount == 3)
    }
}
