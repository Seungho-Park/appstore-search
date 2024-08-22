//
//  NetworkService.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/14/24.
//

import Foundation

protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, NetworkServiceError>)-> Void
    
    func request(request: NetworkRequestable, completion: @escaping CompletionHandler)-> URLSessionTask?
}

protocol NetworkSessionManager {
    typealias CompletionHandler = @Sendable (Data?, URLResponse?, Error?)-> Void
    
    var session: URLSession { get }
    
    func request(with request: URLRequest, completion: @escaping CompletionHandler)-> URLSessionTask
}

final class DefaultNetworkSessionManager: NetworkSessionManager {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(with request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionTask {
        let task = session.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
}

final class DefaultNetworkService: NetworkService {
    private let config: NetworkConfigurable
    private let sessionManager: NetworkSessionManager
    
    init(config: NetworkConfigurable, sessionManager: NetworkSessionManager = DefaultNetworkSessionManager()) {
        self.config = config
        self.sessionManager = sessionManager
    }
    
    func request(request: NetworkRequestable, completion: @escaping CompletionHandler) -> URLSessionTask? {
        do {
            let urlRequest = try request.urlRequest(config)
            return self.request(request: urlRequest, completion: completion)
        } catch {
            completion(.failure(.urlGeneration))
            return nil
        }
    }
    
    private func request(request: URLRequest, completion: @escaping CompletionHandler)-> URLSessionTask {
        let task = sessionManager.request(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if 200..<300 ~= httpResponse.statusCode {
                    completion(.success(data))
                } else {
                    completion(.failure(.error(statusCode: httpResponse.statusCode, data: data)))
                }
            } else if let error = error {
                completion(.failure(self.resolve(error: error)))
            } else {
                completion(.failure(.connectionRefused))
            }
        }
        
        return task
    }
    
    private func resolve(error: Error)-> NetworkServiceError {
        let code = URLError.Code(rawValue: (error as NSError).code)
        switch code {
        case .cancelled: return .cancelled
        case .notConnectedToInternet: return .connectionRefused
        default: return .generic(error)
        }
    }
}
