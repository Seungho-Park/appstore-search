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
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Game, App, Story, etc...".localized
        controller.obscuresBackgroundDuringPresentation = false
        controller.navigationItem.hidesSearchBarWhenScrolling = false
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .white
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.title = Decimal(154199).formatted(.currency(code: Locale.current.currency?.identifier ?? "USD").grouping(.automatic))
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
