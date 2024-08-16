//
//  NetworkConfig.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/9/24.
//

import Foundation

protocol NetworkConfigurable {
    var baseUrl: String { get }
    var headers: [String:String] { get }
    var queryParameters: [String:Any] { get }
}

final class NetworkConfig: NetworkConfigurable {
    let baseUrl: String
    let headers: [String : String]
    let queryParameters: [String : Any]
    
    init(baseUrl: String, headers: [String : String] = [:], queryParameters: [String : Any] = [:]) {
        self.baseUrl = baseUrl
        self.headers = headers
        self.queryParameters = queryParameters
    }
}
