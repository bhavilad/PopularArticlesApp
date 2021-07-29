//
//  ArticleListUseCase.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit
import Foundation

final class ArticleListUseCase: BaseUseCase<ArticleListModel> {
    
    private var articleRepository: ArticleRepository!
    
    init(repository: ArticleRepository = ArticleRepository()) {
        self.articleRepository = repository
    }
    
    override func validate() throws {
        guard !UIApplication.shared.apiKey.isEmpty else {
            throw NetworkError.custom(message: "API Key cannot be empty.")
        }
    }
    
    override func process(onCompletion: @escaping (Result<ArticleListModel?, NetworkError>) -> Void) {
        articleRepository.fetch { response in
            onCompletion(response)
        }
    }
}
