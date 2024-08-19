//
//  String+Extension.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/19/24.
//

import Foundation

extension String {
    var localized: String {
        return String(localized: LocalizationValue(self))
    }
}
