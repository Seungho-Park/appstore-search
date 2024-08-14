//
//  URLSessionProtocol.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/14/24.
//

import Foundation

protocol URLSessionProtocol {
    typealias CompletionHandler = @Sendable (Data?, URLResponse?, Error?)-> Void
    
    func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler)-> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {  }
