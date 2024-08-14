//
//  ViewModelBindable.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import UIKit

protocol ViewModelBindable: NSObjectProtocol {
    associatedtype ViewModel
    
    var viewModel: ViewModel! { get set }
    
    func bind()
}

extension ViewModelBindable where Self: UIViewController {
    static func create(with viewModel: ViewModel)-> Self {
        let vc = Self.init()
        vc.viewModel = viewModel
        return vc
    }
}
