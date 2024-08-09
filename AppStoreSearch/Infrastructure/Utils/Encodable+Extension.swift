//
//  Encodable+Extension.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/9/24.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String:Any]? {
        guard
            let data = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(with: data) else {
            return nil
        }
        
        return dictionary as? [String:Any]
    }
}
