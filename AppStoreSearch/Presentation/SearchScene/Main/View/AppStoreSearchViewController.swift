//
//  AppStoreSearchViewController.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AppStoreSearchViewController: BaseViewController<AppStoreSearchViewModel> {
    private let flexView = UIView()
    private lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "게임, 앱, 스토리 등"
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.title = "asdaddd"
    }
    
    override func configure() {
        super.configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func bind() {
        super.bind()
    }
}
