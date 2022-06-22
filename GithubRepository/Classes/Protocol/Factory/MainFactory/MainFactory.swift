//
//  MainFactory.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation

protocol MainFactory {
    func makeMainViewController(coordinator : MainCoordinator) -> MainViewController
    func makeMainViewModel(coordinator : MainCoordinator) -> MainViewModel
}
