//
//  Networking.swift
//  GithubRepository
//
//  Created by Mehran on 3/25/1401 AP.
//

import Foundation
import Alamofire

enum Networking {
    case searchRepositories(query: String, page: Int, per_page: Int = 5)
}

extension Networking : TargetType {
    
    var baseURL: String {
        return BuildConfig.setAppState.baseURL
    }
    
    var version: String {
        return BuildConfig.setAppState.version
    }
    
    var path: RequestType {
        switch self {
        case .searchRepositories(let query, let page, let per_page):
            return .queryParametrs(query: "\("/search/repositories")\(["q":query, "page":page, "per_page":per_page].queryString)")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .searchRepositories:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .searchRepositories:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default :
            return ["Content-Type":"application/json"]
        }
    }
}
