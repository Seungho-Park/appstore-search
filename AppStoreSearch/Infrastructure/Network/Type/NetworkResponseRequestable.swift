//
//  NetworkResponseRequestable.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/13/24.
//

import Foundation

protocol NetworkResponseRequestable: NetworkRequestable {
    associatedtype Response
    
    var decoder: NetworkResponseDecoder { get }
}
