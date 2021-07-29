//
//  BaseRepository.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation

class BaseRepository {
    
    var networkManager: NetworkAdaptor
    
    init(networkManager: NetworkAdaptor = NetworkManager()) {
        self.networkManager = networkManager
    }
}
