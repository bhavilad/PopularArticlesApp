//
//  MockNetworkAdaptor.swift
//  PopularArticlesAppTests
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import XCTest
@testable import PopularArticlesApp

struct MockNetworkAdaptor: NetworkAdaptor {
    
    let fileName: String
    
    private func dataFromTestFile(for fileName: String) -> Data? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }
    
    func process<T>(_ request: String, for model: T.Type, onCompletion: @escaping (Result<T?, NetworkError>) -> Void) where T : Decodable, T : Encodable {
        guard let data = dataFromTestFile(for: fileName) else {
            return
        }
        
        let decodedData = try! JSONDecoder().decode(model, from: data)
        onCompletion(.success(decodedData))
    }
}
