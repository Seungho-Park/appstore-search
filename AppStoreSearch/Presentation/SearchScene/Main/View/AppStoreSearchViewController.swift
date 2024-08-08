//
//  AppStoreSearchViewController.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import UIKit

class AppStoreSearchViewController: UIViewController, ViewModelBindable {
    var viewModel: AppStoreSearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.accessibilityIdentifier = SceneIdentifier.search
    }
    
    func bind() {
        
    }
}
