//
//  BuildConfigTest.swift
//  GithubRepositoryTests
//
//  Created by Mehran Kamalifard on 6/19/22.
//

import XCTest
@testable import GithubRepository

class BuildConfigTest: XCTestCase {
    
    var sut : AppConfiguration!

    override func setUp() {
        super.setUp()
        sut = FakeBuildConfig()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testBuildConfig_WhenBaseURL_ShouldReturnString() {
        XCTAssertTrue(sut.baseURL as Any is String)
        XCTAssertTrue(sut.baseURL == "www.test.com")
    }
    
    func testBuildConfig_WhenVersion_ShouldReturnString() {
        XCTAssertTrue(sut.version as Any is String)
        XCTAssertTrue(sut.version == "v0")
    }
    
    func testBuildConfig_WhenIsVPNConnected_ShouldReturnBool() {
        XCTAssertTrue(sut.isVPNConnected() as Any is Bool)
        XCTAssertTrue(sut.isVPNConnected() == true)
    }
    
    func testBuildConfig_WhenisJailBrokenDevice_ShouldReturnBool() {
        XCTAssertTrue(sut.isJailBrokenDevice() as Any is Bool)
        XCTAssertTrue(sut.isVPNConnected() == true)
    }
    
    func testBuildConfig_WhenisEnableCertificatePinningDevice_ShouldReturnBool() {
        XCTAssertTrue(sut.enableCertificatePinning() as Any is Bool)
        XCTAssertTrue(sut.isVPNConnected() == true)
    }
}
