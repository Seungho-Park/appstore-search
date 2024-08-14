//
//  MockNetworkConfig.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/9/24.
//

import Foundation

struct MockNetworkConfig: NetworkConfigurable {
    let baseUrl: String
    let headers: [String : String]
    let queryParameters: [String : Any]
    
    init(
        baseUrl: String = "https://mock.config.com",
        headers: [String:String] = [:],
        queryParameters: [String:Any] = [:]
    ) {
        self.baseUrl = baseUrl
        self.headers = headers
        self.queryParameters = queryParameters
    }
}
