//
//  RawDataResponseDecoder.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/13/24.
//

import Foundation

final class RawDataResponseDecoder: NetworkResponseDecoder {
    enum CodingKeys: String, CodingKey {
        case `default` = ""
    }
    
    func decode<T: Decodable>(_ data: Data) throws -> T {
        if T.self is Data.Type, let data = data as? T {
            return data
        } else {
            let context = DecodingError.Context(
                codingPath: [CodingKeys.default],
                debugDescription: "Expected Data type"
            )
            throw Swift.DecodingError.typeMismatch(T.self, context)
        }
    }
}
