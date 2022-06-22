//
//  DependencyAssembler.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation


fileprivate let sharedDependencyAssembler : DependencyAssembler = DependencyAssembler()

protocol DependencyAssemblerInjector {
    var dependencyAssembler : DependencyAssembler { get }
}

extension DependencyAssemblerInjector {
    var dependencyAssembler : DependencyAssembler{
        return sharedDependencyAssembler
    }
}

final class DependencyAssembler {
     init() {}
}

extension DependencyAssembler : MainFactory {
    func makeMainViewController(coordinator: MainCoordinator) -> MainViewController {
        let vc = MainViewController(viewModel: self.makeMainViewModel(coordinator: coordinator),
                                    contentView: MainView(),
                                    throttler: Throttler(interval: 2.0))
        vc.viewModel = self.makeMainViewModel(coordinator: coordinator)
        return vc
    }
    
    func makeMainViewModel(coordinator: MainCoordinator) -> MainViewModel {
        let viewModel = MainViewModel(seachRepositories: RepositorySearchDataProvider())
        return viewModel
    }
}
