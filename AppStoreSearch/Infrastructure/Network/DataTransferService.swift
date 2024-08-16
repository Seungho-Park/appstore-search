//
//  DataTransferService.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/14/24.
//

import Foundation

protocol DataTransferService {
    typealias CompletionHandler<T> = (Result<T, DataTransferError>)-> Void
    
    @discardableResult
    func request<E: NetworkResponseRequestable, T: Decodable>(with endpoint: E, completion: @escaping CompletionHandler<T>)-> URLSessionTask? where E.Response == T
    
    @discardableResult
    func request<E: NetworkResponseRequestable, T: Decodable>(with endpoint: E, queue: DispatchQueue, completion: @escaping CompletionHandler<T>)-> URLSessionTask? where E.Response == T
    
    @discardableResult
    func request<E: NetworkResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<Void>)-> URLSessionTask? where E.Response == Void
    
    @discardableResult
    func request<E: NetworkResponseRequestable>(with endpoint: E, queue: DispatchQueue, completion: @escaping CompletionHandler<Void>)-> URLSessionTask? where E.Response == Void
}

final class DefaultDataTransferService: DataTransferService {
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func request<E, T>(with endpoint: E, completion: @escaping CompletionHandler<T>) -> URLSessionTask? where E : NetworkResponseRequestable, T : Decodable, T == E.Response {
        return request(with: endpoint, queue: .main, completion: completion)
    }
    
    func request<E, T>(with endpoint: E, queue: DispatchQueue, completion: @escaping CompletionHandler<T>) -> URLSessionTask? where E : NetworkResponseRequestable, T : Decodable, T == E.Response {
        return service.request(request: endpoint) { result in
            switch result {
            case .success(let data):
                let response: Result<T, DataTransferError> = self.decode(data: data, decoder: endpoint.decoder)
                queue.async {
                    completion(response)
                }
            case .failure(let error):
                queue.async {
                    completion(.failure(.networkError(error)))
                }
            }
        }
    }
    
    func request<E>(with endpoint: E, completion: @escaping CompletionHandler<Void>) -> URLSessionTask? where E : NetworkResponseRequestable, E.Response == () {
        return request(with: endpoint, queue: .main, completion: completion)
    }
    
    func request<E>(with endpoint: E, queue: DispatchQueue, completion: @escaping CompletionHandler<Void>)-> URLSessionTask? where E : NetworkResponseRequestable, E.Response == Void {
        
        return service.request(request: endpoint) { result in
            switch result {
            case .success:
                queue.async {
                    completion(.success(()))
                }
            case .failure(let error):
                queue.async {
                    completion(.failure(.networkError(error)))
                }
            }
        }
    }
    
    private func decode<T: Decodable>(data: Data?, decoder: NetworkResponseDecoder)-> Result<T, DataTransferError> {
        do {
            guard let data = data, !data.isEmpty else { return .failure(.noResponse) }
            let result: T = try decoder.decode(data)
            return .success(result)
        } catch {
            return .failure(.parsing(error))
        }
    }
}
