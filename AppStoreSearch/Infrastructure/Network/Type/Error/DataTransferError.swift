//
//  DataTransferError.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/16/24.
//

import Foundation

enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
    case networkError(Error)
}
