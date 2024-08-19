//
//  AppAppearance.swift
//  AppStoreSearch
//
//  Created by 박승호 on 8/16/24.
//

import Foundation
import UIKit

final class AppAppearance {
    private init() {  }
    
    static func configure() {
        UINavigationBar.appearance().prefersLargeTitles = true
        
        if #available(iOS 13.0, *) {
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.configureWithOpaqueBackground()
            
            let scrollAppearance = UINavigationBarAppearance()
            scrollAppearance.configureWithOpaqueBackground()
            scrollAppearance.backgroundColor = .clear
            scrollAppearance.shadowColor = .clear
            
            UINavigationBar.appearance().standardAppearance = standardAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = scrollAppearance
        } else {
            
        }
    }
}
