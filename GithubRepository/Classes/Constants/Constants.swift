//
//  Constants.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation

enum NavbarTitle {
    case home
}

extension NavbarTitle {
    
    var desc : String {
        switch self {
        case .home: return "GitHub Repositories"
        }
    }
}
