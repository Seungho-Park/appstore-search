//
//  BaseViewController.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import UIKit

class BaseViewController<VM: ViewModel>: UIViewController, ViewModelBindable {
    var viewModel: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#function)")
        
        configure()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(#function)")
    }
    
    func configure() {
        print("\(#function)")
    }
    
    func bind() {
        print("\(#function)")
    }
}
