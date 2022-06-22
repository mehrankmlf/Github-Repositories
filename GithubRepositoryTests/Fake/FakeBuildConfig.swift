//
//  FakeBuildConfig.swift
//  GithubRepositoryTests
//
//  Created by Mehran Kamalifard on 6/19/22.
//

import Foundation
@testable import GithubRepository

class FakeBuildConfig : AppConfiguration {
    
    var baseURL: String = "www.test.com"
    var version: String = "v0"
    
    func isVPNConnected() -> Bool {
        return true
    }
    
    func isJailBrokenDevice() -> Bool {
        return true
    }
    
    func enableCertificatePinning() -> Bool {
        return true
    }
}
