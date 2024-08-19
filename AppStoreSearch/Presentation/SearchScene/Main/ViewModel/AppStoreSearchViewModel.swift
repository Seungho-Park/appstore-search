//
//  AppStoreSearchViewModel.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation
import RxSwift
import RxCocoa

extension AppStoreSearchViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input) -> Output {
        return .init()
    }
}

class AppStoreSearchViewModel {
    let disposeBag: DisposeBag = DisposeBag()
    
    let title: Driver<String>
    
    init(title: String) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "N/A")
    }
}
