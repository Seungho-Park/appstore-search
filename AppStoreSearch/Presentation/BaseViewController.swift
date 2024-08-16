//
//  BaseViewController.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import UIKit
import FlexLayout
import PinLayout

class BaseViewController<VM: ViewModel>: UIViewController, ViewModelBindable {
    var viewModel: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#function)")
        
        configure()
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
        
        //메인 화면을 제외한 부분은 LargeTitle을 사용하지 않음.
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func bind() {
        print("\(#function)")
    }
}
