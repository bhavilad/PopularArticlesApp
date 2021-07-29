//
//  UIApplication+Extension.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit

extension UIApplication {
    var baseUrl: String {
        get {
            guard let url = Bundle.main.object(forInfoDictionaryKey: "baseUrl") as? String else {
                return ""
            }
            return url
        }
    }
    
    var apiKey: String {
        get {
            guard let key = Bundle.main.object(forInfoDictionaryKey: "apiKey") as? String else {
                return ""
            }
            return key
        }
    }
}
