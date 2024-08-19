//
//  SearchSceneDIContainer.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/19/24.
//

import Foundation
import UIKit

final class SearchSceneDIContainer {
    struct Dependencies {
        
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeSearchSceneCoordinator(navigationController: UINavigationController)-> SearchSceneCoordinator {
        return SearchSceneCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    deinit {
        print("\(Self.self) - \(#function)")
    }
}

extension SearchSceneDIContainer: SearchSceneCoordinatorDependencies {
    
}
