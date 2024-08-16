//
//  Scene.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import UIKit

protocol Scene {
    
    func instantiate()-> UIViewController
}

enum AppScene: Scene {
    case search(AppStoreSearchViewModel)
    
    func instantiate() -> UIViewController {
        switch self {
        case .search(let viewModel):
            let vc = AppStoreSearchViewController.create(with: viewModel)
            vc.view.accessibilityIdentifier = SceneIdentifier.search
            vc.navigationItem.largeTitleDisplayMode = .always
            return vc
        }
    }
}
