//
//  Configuration.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation

enum BaseURLType {
    
    case baseApi
    case staging
    
    var desc : String {
        
        switch self {
        case .baseApi :
            return "https://api.github.com"
        case .staging :
            return "https://api.github.com"
        }
    }
}

enum VersionType {
    case empty
    case v0, v1
    
    var desc : String {
        switch self {
        case .empty :
            return ""
        case .v0 :
            return "/v0"
        case .v1 :
            return "/v1"
        }
    }
}
