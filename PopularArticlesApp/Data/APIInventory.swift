//
//  APIInventory.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit

struct APIInventory {
    
    static let articleListAPI = UIApplication.shared.baseUrl + "svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=" + UIApplication.shared.apiKey
}
