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
