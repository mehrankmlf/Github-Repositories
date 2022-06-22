//
//  MockEndPoint.swift
//  GithubRepositoryTests
//
//  Created by Mehran Kamalifard on 6/19/22.
//

import Foundation
@testable import GithubRepository

class  FakeEndPoint : TargetType {
    
    var baseURL: String = "www.testUrl.com"
    var version: String = "v1"
    var path: RequestType = .requestPath(path: "test")
    var method: HTTPMethod = .post
    var task: Task = .requestParameters(parameters: ["test" : 1], encoding: .default)
    var headers: [String : String]? = ["header": "header"]
}
