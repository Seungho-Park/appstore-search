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
    
    func transition(scene: Scene, style: TransitionStyle, animated: Bool)
    func close(animated: Bool, completion: @escaping ()-> Void)
}

extension Coordinator {
    func transition(scene: Scene, style: TransitionStyle, animated: Bool) {
        let vc = scene.instantiate()
        
        switch style {
        case .root:
            navigationController.setViewControllers([vc], animated: animated)
        case .push:
            navigationController.pushViewController(vc, animated: animated)
        case .modal:
            let completion: ()-> Void = {
                let parentVC = navigationController.topViewController ?? navigationController
                parentVC.present(vc, animated: animated)
            }
            
            if let presentedVC = navigationController.topViewController?.presentedViewController ?? navigationController.presentedViewController {
                presentedVC.dismiss(animated: animated, completion: completion)
            } else {
                completion()
            }
        }
    }
    
    func close(animated: Bool, completion: @escaping ()-> Void) {
        if let presentedVC = navigationController.topViewController?.presentedViewController {
            presentedVC.dismiss(animated: animated, completion: completion)
        } else if navigationController.topViewController != nil {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            navigationController.popViewController(animated: animated)
            CATransaction.commit()
        }
    }
}

final class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let diContainer: AppDIContainer
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        let diContainer = diContainer.makeSearchSceneDIContainer()
        let coordinator = diContainer.makeSearchSceneCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
