//
//  AppDelegate.swift
//  GithubRepository
//
//  Created by Mehran on 3/25/1401 AP.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator : AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setRootViewController()
        return true
    }
}

extension AppDelegate {
    func setRootViewController() {
        let navigationController: UINavigationController = .init()
        self.appCoordinator = AppCoordinator.init(navigationController)
        
        self.appCoordinator?.start()
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

