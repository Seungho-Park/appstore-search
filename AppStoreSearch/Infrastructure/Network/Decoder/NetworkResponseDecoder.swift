//
//  NetworkResponseDecoder.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/9/24.
//

import Foundation

protocol NetworkResponseDecoder {
    func decode<T: Decodable>(_ data: Data)-> T
}
