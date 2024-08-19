//
//  SearchSceneCoordinator.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/19/24.
//

import Foundation
import UIKit

protocol SearchSceneCoordinatorDependencies {
    
}

final class SearchSceneCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let dependencies: SearchSceneCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: SearchSceneCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        
    }
    
    deinit {
        print("\(Self.self) - \(#function)")
    }
}
