//
//  JSONResponseDecoder.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/9/24.
//

import Foundation

final class JSONResponseDecoder: NetworkResponseDecoder {
    let decoder = JSONDecoder()
    
    func decode<T: Decodable>(_ data: Data) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
}
