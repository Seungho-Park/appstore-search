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
}
