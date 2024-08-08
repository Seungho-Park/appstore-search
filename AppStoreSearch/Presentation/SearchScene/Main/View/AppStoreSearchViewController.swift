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
        
        self.view.backgroundColor = .cyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func bind() {
        
    }
}
