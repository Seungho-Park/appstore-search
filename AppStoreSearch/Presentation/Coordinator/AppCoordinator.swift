//
//  AppCoordinator.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
}

final class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let diContainer: AppDIContainer
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        let vc = AppStoreSearchViewController.create(with: .init())
        navigationController.pushViewController(vc, animated: false)
    }
}
