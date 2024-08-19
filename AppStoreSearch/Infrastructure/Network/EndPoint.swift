//
//  EndPoint.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/13/24.
//

import Foundation

final class EndPoint<R>: NetworkResponseRequestable {
    typealias Response = R
    
    var path: String
    var method: HttpMethod
    var headers: [String : String]
    var queryParameterEncodable: Encodable?
    var queryParameters: [String : Any]
    var bodyParameterEncodable: Encodable?
    var bodyParameters: [String : Any]
    var decoder: NetworkResponseDecoder
    
    init(
        path: String,
        method: HttpMethod = .get,
        headers: [String : String] = [:],
        queryParameterEncodable: Encodable? = nil,
        queryParameters: [String : Any] = [:],
        bodyParameterEncodable: (any Encodable)? = nil,
        bodyParameters: [String : Any] = [:],
        decoder: NetworkResponseDecoder = JSONResponseDecoder()
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.queryParameterEncodable = queryParameterEncodable
        self.queryParameters = queryParameters
        self.bodyParameterEncodable = bodyParameterEncodable
        self.bodyParameters = bodyParameters
        self.decoder = decoder
    }
}
