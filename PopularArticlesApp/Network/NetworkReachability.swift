//
//  NetworkReachability.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Alamofire

final class NetworkReachability {
    
    static let shared = NetworkReachability()
    private let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    var isInternetAvailable = true
    
    init() {
        startListening()
    }
    
    private func startListening() { // checking internet availability
        
        reachabilityManager?.startListening(onUpdatePerforming: { [weak self] status in
            if case .reachable(_) = status {
                self?.isInternetAvailable = true
            } else {
                self?.isInternetAvailable = false
            }
        })
    }
}
