//
//  NetworkServiceError.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/14/24.
//

import Foundation

enum NetworkServiceError: Error {
    case error(statusCode: Int, data: Data?)
    case urlGeneration
    case cancelled
    case connectionRefused
    case generic(Error)
}
