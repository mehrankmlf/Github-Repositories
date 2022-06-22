//
//  MockModels.swift
//  GithubRepositoryTests
//
//  Created by Mehran Kamalifard on 6/19/22.
//

import Foundation

@testable import GithubRepository

extension RepositoryBaseModel {
    static let mockData = RepositoryBaseModel(items: [Repository.mockData])
}

extension Repository {
    static let mockData = Repository(id: 1, name: "name", fullName: "fullName", starsCount: 1, repoDescription: "repoDescription", openIssuesCount: 1, language: "swift", owner: Owner.mockData)
}

extension Owner {
    static let mockData = Owner(id: 1, login: "login", avatarURL: "avatarURL", gravatarID: "gravatarID", url: "url", htmlURL: "htmlURL", followersURL: "followersURL", followingURL: "followingURL", gistsURL: "gistsURL", starredURL: "starredURL", subscriptionsURL: "subscriptionsURL", organizationsURL: "organizationsURL", reposURL: "reposURL", eventsURL: "eventsURL", receivedEventsURL: "receivedEventsURL")
}

extension RepositoriesQuery {
    static let mockData = RepositoriesQuery(query: "test")
}
