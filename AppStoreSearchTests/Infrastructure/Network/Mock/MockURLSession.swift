//
//  MockURLSession.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/14/24.
//

import Foundation

final class MockURLSession: URLProtocol {
    static var resumeHandler: ((URLRequest)-> (Data?, URLResponse?, Error?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockURLSession.resumeHandler else {
            client?.urlProtocol(self, didFailWithError: URLError.init(URLError.badServerResponse))
            client?.urlProtocolDidFinishLoading(self)
            return
        }
        
        let (data, response, error) = handler(self.request)
        
        if let response = response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        if let data = data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let error = error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
    
    static var stub: URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSession.self]
        return URLSession(configuration: configuration)
    }
}
