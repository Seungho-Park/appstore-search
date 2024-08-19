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
    var queryParameterEncodable: Encodable? = nil
    var queryParameters: [String : Any] = [:]
    var bodyParameterEncodable: Encodable? = nil
    var bodyParameters: [String : Any] = [:]
    var decoder: NetworkResponseDecoder = JSONResponseDecoder()
    
    init(path: String, method: HttpMethod, queryParameterEncodable: Encodable? = nil, queryParameters: [String : Any] = [:], bodyParameterEncodable: Encodable? = nil) {
        self.path = path
        self.method = method
        self.queryParameterEncodable = queryParameterEncodable
        self.queryParameters = queryParameters
        self.bodyParameterEncodable = bodyParameterEncodable
    }
}
