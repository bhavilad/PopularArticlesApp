//
//  NetworkManager.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation
import Alamofire

enum ErrorMessages: String{
    case internetNotAvailable = "Internet not available"
    case apiFailure = "API Failure"
    case emptyData = "Response data is empty"
    case parsingError = "Parsing Error"
}

enum NetworkError: Error {
    case noInternetConnection
    case error(message: ErrorMessages)
}

protocol NetworkAdaptor {
    func process<T: Codable>(_ request: String,
                             for model: T.Type,
                             onCompletion: @escaping (Result<T?, NetworkError>) -> Void)
}

struct NetworkManager: NetworkAdaptor {
    
    let reachability = NetworkReachability()
    
    private func dataRequest(for request: DataRequest,
                             onCompletion: @escaping (Result<Data?, NetworkError>) -> Void) {
        request.responseString { responseString in
            guard let data = responseString.data,
                  responseString.response != nil else {
                onCompletion(.failure(.error(message: .apiFailure)))
                return
            }
            onCompletion(.success(data))
        }
    }
    
    func process<T: Codable>(_ url: String,
                             for model: T.Type,
                             onCompletion: @escaping (Result<T?, NetworkError>) -> Void) {
        if !reachability.isInternetAvailable {
            onCompletion(.failure(.error(message: .internetNotAvailable)))
        } else {
            let request = AF.request(url).validate()
            dataRequest(for: request) { response in
                switch response {
                case .success(let data):
                    do {
                        guard let data = data else {
                            onCompletion(.failure(.error(message: .emptyData)))
                            return
                        }
                        let model = try JSONDecoder().decode(T.self, from: data)
                        onCompletion(.success(model))
                    } catch {
                        onCompletion(.failure(.error(message: .parsingError)))
                    }
                case .failure(_):
                    onCompletion(.failure(.error(message: .apiFailure)))
                }
            }
        }
    }
}
