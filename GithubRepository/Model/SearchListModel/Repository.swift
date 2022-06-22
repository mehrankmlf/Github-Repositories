//
//  SearchListModel.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation

// MARK: - Repository
struct Repository: Decodable {
    
    var id: Int?
    var name: String?
    var fullName: String?
    var starsCount: Int?
    var repoDescription: String?
    var openIssuesCount: Int?
    var language: String?
    var owner: Owner?
}

extension Repository {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case fullName = "full_name"
        case starsCount = "stargazers_count"
        case repoDescription = "description"
        case openIssuesCount = "open_issues_count"
        case language = "language"
        case owner = "owner"
    }
}


