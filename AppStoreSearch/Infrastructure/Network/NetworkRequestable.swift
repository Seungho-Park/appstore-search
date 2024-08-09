//
//  NetworkRequestable.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/9/24.
//

import Foundation

protocol NetworkRequestable {
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String:String] { get }
    var queryParameters: [String:Any] { get }
    var httpEncodableBody: Encodable? { get }
    var bodyQueryParameters: [String:Any] { get }
}

extension NetworkRequestable {
    private func url(_ config: NetworkConfigurable) throws -> URL {
        let baseUrl = config.baseUrl.last == "/" ? "\(config.baseUrl)+\(path)" : "\(config.baseUrl)/\(path)"
        
        guard var urlComponents = URLComponents(string: baseUrl) else {
            throw NSError()
        }
        
        var queryItems: [URLQueryItem] = config.queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        queryItems.append(contentsOf: queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") })
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw NSError()
        }
        
        return url
    }
    
    func urlRequest(_ config: NetworkConfigurable) throws -> URLRequest {
        let url = try url(config)
        var request = URLRequest(url: url)
        var headers = config.headers
        self.headers.forEach {
            headers.updateValue($0.key, forKey: $0.value)
        }
        
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        let httpBody = httpEncodableBody?.toDictionary() ?? bodyQueryParameters
        if !httpBody.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: httpBody)
        }
        
        return request
    }
}
