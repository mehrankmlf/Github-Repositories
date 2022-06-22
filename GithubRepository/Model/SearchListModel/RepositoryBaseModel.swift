//
//  RepositoryBaseModel.swift
//  GithubRepository
//
//  Created by Mehran Kamalifard on 6/19/22.
//

import Foundation

struct RepositoryBaseModel : Decodable {
    var total : Int?
    var incomplete_results : Bool?
    var items : [Repository]?
}

extension RepositoryBaseModel {
    enum CodingKeys: String, CodingKey {
        case total = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
    }
}
