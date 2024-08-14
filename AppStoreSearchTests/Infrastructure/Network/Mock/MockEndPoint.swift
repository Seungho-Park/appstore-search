//
//  MockEndPoint.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/14/24.
//

import Foundation

struct MockEndPoint<R>: NetworkResponseRequestable {
    typealias Response = R
    
    var path: String
    var method: HttpMethod
    var headers: [String : String] = [:]
    var queryParameters: [String : Any] = [:]
    var httpEncodableBody: Encodable? = nil
    var bodyQueryParameters: [String : Any] = [:]
    var decoder: NetworkResponseDecoder = JSONResponseDecoder()
    
    init(path: String, method: HttpMethod) {
        self.path = path
        self.method = method
    }
}
