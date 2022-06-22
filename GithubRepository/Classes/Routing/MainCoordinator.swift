//
//  MainCoordinator.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import UIKit
import Combine

protocol MainViewFactory {
    var mainFactory : MainFactory { get set }
}

protocol MainCoordinatorProtocol : Coordinator, MainViewFactory {
    func showMainViewController()
}

final class MainCoordinator : MainCoordinatorProtocol {

    var finishDelegate: FinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .main }
    var mainFactory: MainFactory
    private var bag = Set<AnyCancellable>()
    
    init(_ navigationController: UINavigationController, mainFactory : MainFactory) {
        self.navigationController = navigationController
        self.mainFactory = mainFactory
    }
    
    func start() {
        showMainViewController()
    }
    
    func showMainViewController() {
        let vc = self.mainFactory.makeMainViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
