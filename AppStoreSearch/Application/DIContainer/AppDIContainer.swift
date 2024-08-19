//
//  AppDIContainer.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/8/24.
//

import Foundation

final class AppDIContainer {
    
    private lazy var dataTransferService: DataTransferService = {
        let config = NetworkConfig(baseUrl: "https://itunes.apple.com/")
        let networkService = DefaultNetworkService(config: config)
        return DefaultDataTransferService(service: networkService)
    }()
    
    func makeSearchSceneDIContainer()-> SearchSceneDIContainer {
        return SearchSceneDIContainer(dependencies: .init())
    }
    
    deinit {
        print("\(Self.self) - \(#function)")
    }
}
