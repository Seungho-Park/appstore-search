//
//  ViewModel.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input)-> Output
    
    var disposeBag: DisposeBag { get }
    var title: Driver<String> { get }
}
