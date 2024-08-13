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
    var queryParameters: [String : Any]
    var httpEncodableBody: (any Encodable)?
    var bodyQueryParameters: [String : Any]
    var decoder: NetworkResponseDecoder
    
    init(
        path: String,
        method: HttpMethod = .get,
        headers: [String : String] = [:],
        queryParameters: [String : Any] = [:],
        httpEncodableBody: (any Encodable)? = nil,
        bodyQueryParameters: [String : Any] = [:],
        decoder: NetworkResponseDecoder = JSONResponseDecoder()
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.queryParameters = queryParameters
        self.httpEncodableBody = httpEncodableBody
        self.bodyQueryParameters = bodyQueryParameters
        self.decoder = decoder
    }
}
