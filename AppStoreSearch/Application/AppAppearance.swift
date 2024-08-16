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
        if #available(iOS 15.0, *) {
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.configureWithOpaqueBackground()
            standardAppearance.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
            
            let scrollAppearance = UINavigationBarAppearance()
            scrollAppearance.configureWithOpaqueBackground()
            scrollAppearance.backgroundColor = .clear
            scrollAppearance.shadowColor = .clear
            
            UINavigationBar.appearance().standardAppearance = standardAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = scrollAppearance
        } else {
            
        }
        
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}
