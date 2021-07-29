//
//  BaseUseCase.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation

class BaseUseCase<Model: BaseModel> {
    
    func validate() throws { }
    
    func process(onCompletion: @escaping (Result<Model?, NetworkError>) -> Void) { }
    
    func execute(onCompletion: @escaping (Result<Model?, NetworkError>) -> Void) {
        do {
            try validate()
            process { response in
                onCompletion(response)
            }
        } catch let error {
            guard let err = error as? NetworkError else {
                onCompletion(.failure(.custom(message: error.localizedDescription)))
                return
            }
            onCompletion(.failure(err))
        }
    }
}
